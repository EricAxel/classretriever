const test = require("node:test");
const assert = require("node:assert/strict");
const {createRemoveStudentHandler} = require("../remove");

// Firestore en memoria con lo justo que usa removeStudent.
function memoryDb(initial) {
  const data = JSON.parse(JSON.stringify(initial));
  const ref = (col, id) => ({col, id});
  const apply = (r, value) => {
    data[r.col] = data[r.col] || {};
    if (value === null) delete data[r.col][r.id];
    else data[r.col][r.id] = value;
  };
  const current = (r) => (data[r.col] || {})[r.id];
  const update = (r, patch) => {
    const doc = {...current(r)};
    for (const [k, v] of Object.entries(patch)) {
      doc[k] = v && v.__arrayRemove !== undefined ? (doc[k] || []).filter((x) => x !== v.__arrayRemove) : v;
    }
    apply(r, doc);
  };
  const query = (col, field, value, max) => ({
    limit: (n) => query(col, field, value, n),
    get: async () => {
      const docs = Object.entries(data[col] || {})
        .filter(([, d]) => d[field] === value)
        .slice(0, max ?? Infinity)
        .map(([id]) => ({ref: ref(col, id)}));
      return {empty: docs.length === 0, docs};
    },
  });
  return {
    data,
    collection: (col) => ({
      doc: (id) => ref(col, id),
      where: (field, op, value) => query(col, field, value),
    }),
    runTransaction: async (fn) => fn({
      get: async (r) => ({exists: current(r) !== undefined, data: () => current(r)}),
      update: (r, patch) => update(r, patch),
      delete: (r) => apply(r, null),
    }),
    batch: () => {
      const ops = [];
      return {delete: (r) => ops.push(r), commit: async () => ops.forEach((r) => apply(r, null))};
    },
  };
}

const arrayRemove = (v) => ({__arrayRemove: v});
const auth = {verifyIdToken: async (t) => {
  if (t !== "good") throw new Error("bad");
  return {uid: "parent1"};
}};
const logger = {warn: () => {}, info: () => {}};

function fakeRes() {
  const res = {headers: {}, statusCode: null, body: null};
  res.set = (k, v) => ((res.headers[k] = v), res);
  res.status = (c) => ((res.statusCode = c), res);
  res.json = (b) => ((res.body = b), res);
  return res;
}

function fakeReq({body = {studentId: "s1"}, authHeader = "Bearer good", method = "POST"} = {}) {
  return {method, body, get: (h) => (h === "Authorization" ? authHeader : undefined)};
}

function run(initial, {revokeStatus = 200, req} = {}) {
  const db = memoryDb(initial);
  const revokes = [];
  const handler = createRemoveStudentHandler({
    auth, db, arrayRemove, logger,
    fetchImpl: async (url, options) => {
      revokes.push(options.body.get("token"));
      return {ok: revokeStatus === 200, status: revokeStatus};
    },
  });
  const res = fakeRes();
  return handler(req || fakeReq(), res).then(() => ({res, db, revokes}));
}

test("último padre: borra el estudiante y sus tokens, y revoca en Google", async () => {
  const {res, db, revokes} = await run({
    students: {s1: {users_uids: ["parent1"], google_refresh_token: "rt1", email: "a@school.edu"}},
    tokens: {t1: {refreshtoken: "rt1", user: "parent1"}, t2: {refreshtoken: "otro"}},
  });
  assert.equal(res.statusCode, 200);
  assert.deepEqual(res.body, {status: "deleted", revoked: true});
  assert.equal(db.data.students.s1, undefined);
  assert.deepEqual(Object.keys(db.data.tokens), ["t2"]);
  assert.deepEqual(revokes, ["rt1"]);
});

test("con otro padre vinculado: solo quita a este padre, sin revocar", async () => {
  const {res, db, revokes} = await run({
    students: {s1: {users_uids: ["parent1", "parent2"], google_refresh_token: "rt1"}},
  });
  assert.deepEqual(res.body, {status: "unlinked", revoked: false});
  assert.deepEqual(db.data.students.s1.users_uids, ["parent2"]);
  assert.deepEqual(revokes, []);
});

test("si otro registro usa el mismo token, no se revoca", async () => {
  const {res, revokes} = await run({
    students: {
      s1: {users_uids: ["parent1"], google_refresh_token: "rt1"},
      s2: {users_uids: ["parent9"], google_refresh_token: "rt1"},
    },
  });
  assert.deepEqual(res.body, {status: "deleted", revoked: false});
  assert.deepEqual(revokes, []);
});

test("token vacío o \"null\": se borra el estudiante sin llamar a Google", async () => {
  for (const token of ["", "null", undefined]) {
    const {res, revokes} = await run({students: {s1: {users_uids: ["parent1"], google_refresh_token: token}}});
    assert.equal(res.body.status, "deleted");
    assert.deepEqual(revokes, []);
  }
});

test("token ya revocado en Google (400) no es error", async () => {
  const {res} = await run(
    {students: {s1: {users_uids: ["parent1"], google_refresh_token: "rt1"}}},
    {revokeStatus: 400},
  );
  assert.deepEqual(res.body, {status: "deleted", revoked: true});
});

test("un padre no vinculado no puede quitar al estudiante", async () => {
  const {res, db} = await run({students: {s1: {users_uids: ["otro"], google_refresh_token: "rt1"}}});
  assert.equal(res.statusCode, 403);
  assert.ok(db.data.students.s1);
});

test("estudiante inexistente -> 403", async () => {
  const {res} = await run({students: {}});
  assert.equal(res.statusCode, 403);
});

test("sesión inválida, studentId inválido y método incorrecto", async () => {
  let r = await run({students: {}}, {req: fakeReq({authHeader: "Bearer bad"})});
  assert.equal(r.res.statusCode, 401);
  r = await run({students: {}}, {req: fakeReq({body: {studentId: "a/b"}})});
  assert.equal(r.res.statusCode, 400);
  r = await run({students: {}}, {req: fakeReq({method: "GET"})});
  assert.equal(r.res.statusCode, 405);
});
