const test = require("node:test");
const assert = require("node:assert/strict");
const {createTokenProvider, listAll} = require("../google");
const {sanitizeKnown, syncStudent, createSyncHandler} = require("../sync");

const NOW = Date.parse("2026-10-15T00:00:00Z");
const RECENT = "2026-10-01T10:00:00Z";
const OLD = "2024-01-01T10:00:00Z"; // más de 60 semanas
const noSleep = async () => {};

function json(status, body) {
  return {ok: status >= 200 && status < 300, status, json: async () => body};
}

function notJson(status) {
  return {ok: status >= 200 && status < 300, status, json: async () => {
    throw new Error("not json");
  }};
}

// Google falso: rutas -> respuesta (o función). Registra las llamadas.
function fakeGoogle(routes) {
  const calls = [];
  const fetchImpl = async (url) => {
    calls.push(url);
    const u = new URL(url);
    const path = u.pathname.replace("/v1", "");
    const light = u.searchParams.has("fields");
    const key = `${path}${light ? "" : "#full"}`;
    const route = routes[key] ?? routes[path];
    if (route === undefined) return json(404, {error: {code: 404}});
    return typeof route === "function" ? route(u) : route;
  };
  return {fetchImpl, calls};
}

const sub = (courseWorkId, state = "CREATED", updateTime = RECENT) => ({
  id: `sub-${courseWorkId}`, courseWorkId, state, updateTime,
});

function sync(routes, known = {}) {
  const google = fakeGoogle(routes);
  return syncStudent({known, token: "at", fetchImpl: google.fetchImpl, sleep: noSleep, now: () => NOW})
    .then((r) => ({...r, calls: google.calls}));
}

const baseRoutes = {
  "/courses": json(200, {courses: [{id: "c1", name: "Math"}]}),
  "/courses/c1/courseWork": json(200, {courseWork: [{id: "w1", updateTime: RECENT}]}),
  "/courses/c1/courseWork/-/studentSubmissions": json(200, {studentSubmissions: [sub("w1")]}),
  "/courses/c1/courseWork#full": json(200, {courseWork: [{id: "w1", title: "Essay", updateTime: RECENT}]}),
};

test("primera vez: descarga todo con la forma de Google", async () => {
  const r = await sync(baseRoutes);
  assert.equal(r.ok, true);
  assert.equal(r.body.changed.length, 1);
  const w = r.body.changed[0];
  assert.equal(w.title, "Essay");
  assert.equal(w.courseId, "c1");
  assert.deepEqual(w.studentSubmission, {id: "sub-w1", state: "CREATED", updateTime: RECENT});
  assert.deepEqual(r.body.courses, [{id: "c1", name: "Math", ok: true}]);
  assert.equal(r.body.complete, true);
});

test("sin cambios: no descarga el detalle", async () => {
  const first = await sync(baseRoutes);
  const known = {"c1/w1": first.body.changed[0].fingerprint};
  const r = await sync(baseRoutes, known);
  assert.deepEqual(r.body.changed, []);
  assert.deepEqual(r.body.removed, []);
  assert.equal(r.calls.some((u) => !u.includes("fields=")), false);
});

test("cambio de estado de la entrega: se vuelve a descargar esa tarea", async () => {
  const first = await sync(baseRoutes);
  const known = {"c1/w1": first.body.changed[0].fingerprint};
  const routes = {...baseRoutes,
    "/courses/c1/courseWork/-/studentSubmissions": json(200, {studentSubmissions: [sub("w1", "TURNED_IN")]})};
  const r = await sync(routes, known);
  assert.equal(r.body.changed.length, 1);
  assert.equal(r.body.changed[0].studentSubmission.state, "TURNED_IN");
});

test("tarea borrada en Classroom: se marca como eliminada", async () => {
  const r = await sync(baseRoutes, {"c1/w1": "x", "c1/w9": "y"});
  assert.deepEqual(r.body.removed, ["c1/w9"]);
});

test("curso que ya no aparece: sus tareas se eliminan", async () => {
  const r = await sync(baseRoutes, {"c2/w5": "y"});
  assert.deepEqual(r.body.removed, ["c2/w5"]);
});

test("un curso con error no bloquea a los demás y conserva lo guardado", async () => {
  const routes = {...baseRoutes,
    "/courses": json(200, {courses: [{id: "c1", name: "Math"}, {id: "c2", name: "Art"}]}),
    "/courses/c2/courseWork": json(403, {error: {code: 403}}),
    "/courses/c2/courseWork/-/studentSubmissions": json(403, {error: {code: 403}})};
  const r = await sync(routes, {"c2/w5": "y"});
  assert.equal(r.ok, true);
  assert.equal(r.body.changed.length, 1);
  assert.deepEqual(r.body.removed, []);
  assert.deepEqual(r.body.courses[1], {id: "c2", name: "Art", ok: false, errorCode: 403});
  assert.equal(r.body.complete, false);
});

test("tarea sin entrega del estudiante (no asignada): no se incluye", async () => {
  const routes = {...baseRoutes,
    "/courses/c1/courseWork/-/studentSubmissions": json(200, {studentSubmissions: []})};
  const r = await sync(routes);
  assert.deepEqual(r.body.changed, []);
});

test("tarea sin updateTime usa creationTime; sin ninguna fecha se descarta", async () => {
  const routes = {...baseRoutes,
    "/courses/c1/courseWork": json(200, {courseWork: [{id: "w1", creationTime: RECENT}, {id: "w2"}]}),
    "/courses/c1/courseWork/-/studentSubmissions": json(200, {studentSubmissions: [sub("w1"), sub("w2")]}),
    "/courses/c1/courseWork#full": json(200, {courseWork: [{id: "w1", title: "A"}, {id: "w2", title: "B"}]})};
  const r = await sync(routes);
  assert.equal(r.body.changed.length, 1);
  assert.equal(r.body.changed[0].id, "w1");
  assert.equal(r.body.changed[0].updateTime, RECENT);
});

test("tareas de más de 60 semanas no se descargan", async () => {
  const routes = {...baseRoutes,
    "/courses/c1/courseWork": json(200, {courseWork: [{id: "w1", updateTime: OLD}]})};
  const r = await sync(routes);
  assert.deepEqual(r.body.changed, []);
});

test("une todas las páginas", async () => {
  const routes = {...baseRoutes,
    "/courses": (u) => u.searchParams.get("pageToken") === "p2"
      ? json(200, {courses: [{id: "c2", name: "Art"}]})
      : json(200, {courses: [{id: "c1", name: "Math"}], nextPageToken: "p2"})};
  const r = await sync(routes);
  assert.deepEqual(r.body.courses.map((c) => c.id), ["c1", "c2"]);
});

test("Google saturado (429): reintenta una vez", async () => {
  let attempts = 0;
  const routes = {...baseRoutes, "/courses": () => (++attempts === 1
    ? json(429, {error: {code: 429}})
    : json(200, {courses: [{id: "c1", name: "Math"}]}))};
  const r = await sync(routes);
  assert.equal(r.ok, true);
  assert.equal(attempts, 2);
});

test("respuesta que no es JSON: el curso queda con error", async () => {
  const routes = {...baseRoutes, "/courses/c1/courseWork": notJson(200)};
  const r = await sync(routes, {"c1/w1": "x"});
  assert.equal(r.body.courses[0].ok, false);
  assert.deepEqual(r.body.removed, []);
});

test("lista con forma inesperada: el curso queda con error", async () => {
  const routes = {...baseRoutes, "/courses/c1/courseWork": json(200, {courseWork: "oops"})};
  const r = await sync(routes);
  assert.equal(r.body.courses[0].ok, false);
});

test("si falla la lista de cursos, no se toca nada", async () => {
  const r = await sync({"/courses": json(500, {})});
  assert.equal(r.ok, false);
});

test("sin red: listAll no lanza, devuelve error", async () => {
  const r = await listAll({path: "/courses", listKey: "courses", token: "t", sleep: noSleep,
    fetchImpl: async () => {
      throw new Error("offline");
    }});
  assert.deepEqual(r, {ok: false, status: 503, items: []});
});

test("lo que manda el teléfono dañado se ignora (descarga completa)", () => {
  assert.deepEqual(sanitizeKnown(null), {});
  assert.deepEqual(sanitizeKnown([1, 2]), {});
  assert.deepEqual(sanitizeKnown({"c1/w1": 5, "bad": "x", "c1/w2": "ok"}), {"c1/w2": "ok"});
});

test("el token se renueva una vez y se reutiliza; invalid_grant pide reconectar", async () => {
  let refreshes = 0;
  const ok = createTokenProvider({clientId: "id", clientSecret: () => "s",
    fetchImpl: async () => {
      refreshes++;
      return json(200, {access_token: "at", expires_in: 3600});
    }});
  await ok("s1", "rt");
  await ok("s1", "rt");
  assert.equal(refreshes, 1);

  const revoked = createTokenProvider({clientId: "id", clientSecret: () => "s",
    fetchImpl: async () => json(400, {error: "invalid_grant"})});
  await assert.rejects(revoked("s1", "rt"), (e) => e.reconnect === true);
});

// --- Manejador HTTP ---

function fakeRes() {
  const res = {headers: {}, statusCode: null, body: null};
  res.set = (k, v) => ((res.headers[k] = v), res);
  res.status = (c) => ((res.statusCode = c), res);
  res.json = (b) => ((res.body = b), res);
  return res;
}

function fakeReq({body = {studentId: "s1", known: {}}, auth = "Bearer good", method = "POST"} = {}) {
  return {method, body, get: (h) => (h === "Authorization" ? auth : undefined)};
}

const auth = {verifyIdToken: async (t) => {
  if (t !== "good") throw new Error("bad");
  return {uid: "parent1"};
}};

function db(students) {
  return {collection: () => ({doc: (id) => ({
    get: async () => ({exists: id in students, data: () => students[id]}),
  })})};
}

const logger = {warn: () => {}, info: () => {}};
const linked = {s1: {users_uids: ["parent1"], google_refresh_token: "rt"}};

function handler({students = linked, accessTokenFor = async () => "at", routes = baseRoutes} = {}) {
  return createSyncHandler({auth, db: db(students), accessTokenFor,
    fetchImpl: fakeGoogle(routes).fetchImpl, logger, sleep: noSleep, now: () => NOW});
}

test("handler: padre vinculado recibe los cambios y nada se cachea", async () => {
  const res = fakeRes();
  await handler()(fakeReq(), res);
  assert.equal(res.statusCode, 200);
  assert.equal(res.body.changed.length, 1);
  assert.equal(res.headers["Cache-Control"], "private, no-store");
});

test("handler: sesión inválida -> 401", async () => {
  const res = fakeRes();
  await handler()(fakeReq({auth: "Bearer bad"}), res);
  assert.equal(res.statusCode, 401);
});

test("handler: padre no vinculado -> 403", async () => {
  const res = fakeRes();
  await handler({students: {s1: {users_uids: ["otro"], google_refresh_token: "rt"}}})(fakeReq(), res);
  assert.equal(res.statusCode, 403);
});

test("handler: estudiante inexistente -> 403", async () => {
  const res = fakeRes();
  await handler({students: {}})(fakeReq(), res);
  assert.equal(res.statusCode, 403);
});

test("handler: studentId ausente o inválido -> 400", async () => {
  for (const body of [{}, {studentId: ""}, {studentId: "a/b"}, null]) {
    const res = fakeRes();
    await handler()(fakeReq({body}), res);
    assert.equal(res.statusCode, 400);
  }
});

test("handler: refresh token vacío o \"null\" -> RECONNECT_REQUIRED", async () => {
  for (const token of ["", "null", undefined, 42]) {
    const res = fakeRes();
    await handler({students: {s1: {users_uids: ["parent1"], google_refresh_token: token}}})(fakeReq(), res);
    assert.equal(res.statusCode, 401);
    assert.equal(res.body.error.message, "RECONNECT_REQUIRED");
  }
});

test("handler: token revocado -> RECONNECT_REQUIRED; fallo temporal -> 503", async () => {
  const revoked = async () => {
    const e = new Error("invalid_grant");
    e.reconnect = true;
    throw e;
  };
  let res = fakeRes();
  await handler({accessTokenFor: revoked})(fakeReq(), res);
  assert.equal(res.statusCode, 401);
  assert.equal(res.body.error.message, "RECONNECT_REQUIRED");

  const temporary = async () => {
    throw new Error("token_http_500");
  };
  res = fakeRes();
  await handler({accessTokenFor: temporary})(fakeReq(), res);
  assert.equal(res.statusCode, 503);
});

test("handler: Classroom caído -> 503 y el teléfono conserva lo guardado", async () => {
  const res = fakeRes();
  await handler({routes: {"/courses": json(503, {})}})(fakeReq(), res);
  assert.equal(res.statusCode, 503);
  assert.equal(res.body.error.message, "CLASSROOM_UNAVAILABLE");
});

test("handler: solo acepta POST", async () => {
  const res = fakeRes();
  await handler()(fakeReq({method: "GET"}), res);
  assert.equal(res.statusCode, 405);
});
