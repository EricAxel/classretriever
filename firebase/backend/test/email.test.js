const test = require("node:test");
const assert = require("node:assert/strict");
const {createOnboardingEmailHandler, ONBOARDING_HELP_ID} = require("../email");

function fakeRes() {
  const res = {headers: {}, statusCode: null, body: null};
  res.set = (k, v) => ((res.headers[k] = v), res);
  res.status = (c) => ((res.statusCode = c), res);
  res.json = (b) => ((res.body = b), res);
  return res;
}

function fakeReq({body = {email: "parent@example.com", firstName: "Ana"}, auth = "Bearer good", method = "POST"} = {}) {
  return {method, body, get: (h) => (h === "Authorization" ? auth : undefined)};
}

const auth = {verifyIdToken: async (t) => {
  if (t !== "good") throw new Error("bad");
  return {uid: "parent1", email: "Parent@Example.com"};
}};
const logger = {warn: () => {}};

function handler(fetchImpl) {
  const calls = [];
  const h = createOnboardingEmailHandler({
    auth,
    loopsKey: () => "loops-key",
    logger,
    fetchImpl: async (url, options) => {
      calls.push({url, options});
      return fetchImpl ? fetchImpl() : {ok: true, status: 200};
    },
  });
  return {h, calls};
}

test("envía el mismo correo de Loops que antes, al email de la sesión", async () => {
  const {h, calls} = handler();
  const res = fakeRes();
  await h(fakeReq(), res);
  assert.equal(res.statusCode, 200);
  assert.equal(calls.length, 1);
  assert.equal(calls[0].url, "https://app.loops.so/api/v1/transactional");
  assert.equal(calls[0].options.headers.Authorization, "Bearer loops-key");
  assert.deepEqual(JSON.parse(calls[0].options.body), {
    transactionalId: ONBOARDING_HELP_ID,
    email: "parent@example.com",
    dataVariables: {first_name: "Ana"},
  });
});

test("sin email no envía nada (como hacía Loops)", async () => {
  const {h, calls} = handler();
  const res = fakeRes();
  await h(fakeReq({body: {email: "", firstName: ""}}), res);
  assert.equal(res.statusCode, 400);
  assert.equal(calls.length, 0);
});

test("no permite enviar a un email distinto al de la sesión", async () => {
  const {h, calls} = handler();
  const res = fakeRes();
  await h(fakeReq({body: {email: "otra@persona.com", firstName: "X"}}), res);
  assert.equal(res.statusCode, 403);
  assert.equal(calls.length, 0);
});

test("sesión inválida -> 401", async () => {
  const {h} = handler();
  const res = fakeRes();
  await h(fakeReq({auth: "Bearer bad"}), res);
  assert.equal(res.statusCode, 401);
});

test("Loops con error o sin red -> error claro, sin lanzar", async () => {
  let res = fakeRes();
  await handler(() => ({ok: false, status: 400})).h(fakeReq(), res);
  assert.equal(res.statusCode, 502);

  res = fakeRes();
  await handler(() => {
    throw new Error("offline");
  }).h(fakeReq(), res);
  assert.equal(res.statusCode, 503);
});

test("solo acepta POST", async () => {
  const res = fakeRes();
  await handler().h(fakeReq({method: "GET"}), res);
  assert.equal(res.statusCode, 405);
});
