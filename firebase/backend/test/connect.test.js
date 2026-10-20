const test = require("node:test");
const assert = require("node:assert/strict");
const {
  SCOPES, parseConnectData, createConnectHandler, createCallbackHandler,
} = require("../connect");

const NOW = 1_800_000_000_000;
const UID = "parentUid1234567890AB";
const CLIENT_ID = "client.apps.googleusercontent.com";
const REDIRECT = "https://class-retriever-42b99.firebaseapp.com/callback";
const logger = {info: () => {}, warn: () => {}};
const arrayUnion = (v) => ({__arrayUnion: v});

// Firestore en memoria con lo que usan connect y callback.
function memoryDb(initial = {}) {
  const data = JSON.parse(JSON.stringify(initial));
  let autoId = 0;
  const col = (name) => (data[name] = data[name] || {});
  const ref = (name, id) => ({
    id,
    update: async (patch) => {
      const doc = {...col(name)[id]};
      for (const [k, v] of Object.entries(patch)) {
        doc[k] = v && v.__arrayUnion !== undefined
          ? [...new Set([...(doc[k] || []), v.__arrayUnion])]
          : v;
      }
      col(name)[id] = doc;
    },
    set: async (value) => {
      col(name)[id] = value;
    },
    get: async () => {
      // Como Firestore real: la lectura guarda el valor de ese momento.
      const value = col(name)[id];
      return {exists: value !== undefined, data: () => value};
    },
    delete: async () => {
      delete col(name)[id];
    },
  });
  return {
    data,
    collection: (name) => ({
      doc: (id) => ref(name, id),
      add: async (value) => {
        const id = `auto${++autoId}`;
        col(name)[id] = value;
        return ref(name, id);
      },
      where: (field, op, value) => ({
        limit: () => ({
          get: async () => {
            const docs = Object.entries(col(name))
              .filter(([, d]) => d[field] === value)
              .map(([id, d]) => ({id, ref: ref(name, id), data: () => d}));
            return {empty: docs.length === 0, docs};
          },
        }),
      }),
    }),
  };
}

function fakeRes() {
  const res = {headers: {}, statusCode: null, body: null, location: null};
  res.set = (k, v) => ((res.headers[k] = v), res);
  res.status = (c) => ((res.statusCode = c), res);
  res.send = (b) => ((res.body = b), res);
  res.redirect = (c, url) => ((res.statusCode = c), (res.location = url), res);
  return res;
}

const qrData = (email = "student@school.edu", name = "Ana%20Maria") =>
  `AX0${UID}AX1${name}AX2${email}AX3qrDoc123AX4`;

// --- Lectura de los datos del QR ---

test("lee los datos del QR con el formato de siempre", () => {
  assert.deepEqual(parseConnectData(qrData()), {
    uid: UID, name: "Ana Maria", email: "student@school.edu", qrId: "qrDoc123",
  });
});

test("acepta nombres con acentos y & ya decodificados, y emails con +", () => {
  const info = parseConnectData(`AX0${UID}AX1José & AnaAX2ana+tag@school.eduAX3AX4`);
  assert.equal(info.name, "José & Ana");
  assert.equal(info.email, "ana+tag@school.edu");
  assert.equal(info.qrId, "");
});

test("rechaza QR dañados o incompletos", () => {
  for (const bad of [undefined, "", "hola", `AX0abcAX1xAX2a@b.coAX3`, `AX0${UID}AX1xAX2no-es-emailAX3`, "x".repeat(3000)]) {
    assert.equal(parseConnectData(bad), null);
  }
});

// --- connect ---

function connectHandler(db, accessTokenFor = async () => "at") {
  return createConnectHandler({db, accessTokenFor, arrayUnion, clientId: CLIENT_ID, redirectUri: REDIRECT,
    logger, now: () => NOW, randomState: () => "state123"});
}

test("estudiante nuevo: guarda el state y manda a Google con consent y offline", async () => {
  const db = memoryDb();
  const res = fakeRes();
  await connectHandler(db)({method: "GET", query: {data: qrData()}}, res);
  assert.equal(res.statusCode, 302);
  const url = new URL(res.location);
  assert.equal(url.origin + url.pathname, "https://accounts.google.com/o/oauth2/v2/auth");
  assert.equal(url.searchParams.get("client_id"), CLIENT_ID);
  assert.equal(url.searchParams.get("redirect_uri"), REDIRECT);
  assert.equal(url.searchParams.get("prompt"), "consent");
  assert.equal(url.searchParams.get("access_type"), "offline");
  assert.equal(url.searchParams.get("state"), "state123");
  assert.deepEqual(url.searchParams.get("scope").split(" "), SCOPES);
  assert.equal(db.data.oauth_states.state123.email, "student@school.edu");
  assert.equal(db.data.oauth_states.state123.expiresAt, NOW + 30 * 60 * 1000);
});

test("ya conectado con permiso vivo: añade al padre y muestra «Hooray!» sin ir a Google", async () => {
  const db = memoryDb({students: {s1: {email: "student@school.edu", google_refresh_token: "rt", users_uids: ["otroPadre"]}}});
  const res = fakeRes();
  await connectHandler(db)({method: "GET", query: {data: qrData()}}, res);
  assert.equal(res.statusCode, 200);
  assert.match(res.body, /Hooray!/);
  // Misma página que la de estudiante nuevo: perro con gorro y confeti.
  assert.match(res.body, /dog_with_party_hat\.png/);
  assert.match(res.body, /confetti\.json/);
  assert.deepEqual(db.data.students.s1.users_uids, ["otroPadre", UID]);
});

test("ya conectado pero con permiso revocado: vuelve a pedir permiso (reconectar)", async () => {
  const db = memoryDb({students: {s1: {email: "student@school.edu", google_refresh_token: "rt", users_uids: [UID]}}});
  const res = fakeRes();
  const revoked = async () => {
    const e = new Error("invalid_grant");
    e.reconnect = true;
    throw e;
  };
  await connectHandler(db, revoked)({method: "GET", query: {data: qrData()}}, res);
  assert.equal(res.statusCode, 302);
});

test("token guardado como \"null\": va a Google en vez de dar éxito falso", async () => {
  const db = memoryDb({students: {s1: {email: "student@school.edu", google_refresh_token: "null", users_uids: [UID]}}});
  const res = fakeRes();
  await connectHandler(db)({method: "GET", query: {data: qrData()}}, res);
  assert.equal(res.statusCode, 302);
});

test("QR inválido: página de error sin botones", async () => {
  const res = fakeRes();
  await connectHandler(memoryDb())({method: "GET", query: {data: "basura"}}, res);
  assert.equal(res.statusCode, 400);
  assert.match(res.body, /scan the QR code again/);
  assert.doesNotMatch(res.body, /<button|<a /);
});

// --- callback ---

function callbackHandler(db, exchangeResult) {
  return createCallbackHandler({db, arrayUnion, logger, now: () => NOW,
    exchange: async () => exchangeResult});
}

const okExchange = {ok: true, body: {access_token: "at-new", refresh_token: "rt-new", scope: SCOPES.join(" ")}};
const withState = (students = {}) => memoryDb({
  students,
  oauth_states: {st: {uid: UID, name: "Ana Maria", email: "student@school.edu", qrId: "q", expiresAt: NOW + 1000}},
});

test("estudiante nuevo: crea el documento con los mismos 5 campos que BuildShip", async () => {
  const db = withState();
  const res = fakeRes();
  await callbackHandler(db, okExchange)({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.equal(res.statusCode, 200);
  assert.match(res.body, /Hooray!/);
  assert.match(res.body, /dog_with_party_hat\.png/);
  assert.deepEqual(db.data.students.auto1, {
    email: "student@school.edu", google_refresh_token: "rt-new", google_token: "at-new",
    student_given_name: "Ana Maria", users_uids: [UID],
  });
  assert.equal(db.data.oauth_states.st, undefined); // el state se usa una sola vez
});

test("estudiante existente: actualiza tokens y añade al padre, sin cambiar el nombre", async () => {
  const db = withState({s1: {email: "student@school.edu", google_refresh_token: "viejo", google_token: "x",
    student_given_name: "Nombre Original", users_uids: ["otroPadre"]}});
  await callbackHandler(db, okExchange)({method: "GET", query: {code: "c", state: "st"}}, fakeRes());
  assert.deepEqual(db.data.students.s1, {email: "student@school.edu", google_refresh_token: "rt-new",
    google_token: "at-new", student_given_name: "Nombre Original", users_uids: ["otroPadre", UID]});
});

test("si hay dos documentos con el mismo email, actualiza el de este padre", async () => {
  const db = withState({
    a: {email: "student@school.edu", google_refresh_token: "r1", users_uids: ["otro"]},
    b: {email: "student@school.edu", google_refresh_token: "r2", users_uids: [UID]},
  });
  await callbackHandler(db, okExchange)({method: "GET", query: {code: "c", state: "st"}}, fakeRes());
  assert.equal(db.data.students.b.google_refresh_token, "rt-new");
  assert.equal(db.data.students.a.google_refresh_token, "r1");
});

test("el estudiante cancela en Google: mensaje claro y no se guarda nada", async () => {
  const db = withState();
  const res = fakeRes();
  await callbackHandler(db, okExchange)({method: "GET", query: {error: "access_denied", state: "st"}}, res);
  assert.match(res.body, /allow access/);
  assert.equal(Object.keys(db.data.students).length, 0);
});

test("faltan casillas de permiso: pide volver a escanear y marcar todas", async () => {
  const db = withState();
  const res = fakeRes();
  const partial = {ok: true, body: {access_token: "a", refresh_token: "r", scope: SCOPES[0]}};
  await callbackHandler(db, partial)({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.match(res.body, /check all the boxes/);
  assert.equal(Object.keys(db.data.students).length, 0);
});

test("Google no devuelve refresh token: nunca se guarda vacío ni \"null\"", async () => {
  const db = withState();
  const noRefresh = {ok: true, body: {access_token: "a", scope: SCOPES.join(" ")}};
  const res = fakeRes();
  await callbackHandler(db, noRefresh)({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.match(res.body, /couldn't complete/);
  assert.equal(Object.keys(db.data.students).length, 0);
});

test("el canje falla: error claro, nada guardado", async () => {
  const db = withState();
  const res = fakeRes();
  await callbackHandler(db, {ok: false, reason: "invalid_grant"})({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.match(res.body, /couldn't complete/);
  assert.equal(Object.keys(db.data.students).length, 0);
});

test("state desconocido, ya usado o vencido: enlace vencido", async () => {
  let res = fakeRes();
  await callbackHandler(withState(), okExchange)({method: "GET", query: {code: "c", state: "otro"}}, res);
  assert.match(res.body, /expired/);

  const db = memoryDb({oauth_states: {st: {uid: UID, email: "s@school.edu", expiresAt: NOW - 1}}});
  res = fakeRes();
  await callbackHandler(db, okExchange)({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.match(res.body, /expired/);
  assert.equal(db.data.oauth_states.st, undefined);
});

test("la página no envía referrer ni se puede incrustar", async () => {
  const res = fakeRes();
  await callbackHandler(withState(), okExchange)({method: "GET", query: {code: "c", state: "st"}}, res);
  assert.equal(res.headers["Referrer-Policy"], "no-referrer");
  assert.equal(res.headers["X-Frame-Options"], "DENY");
  assert.match(res.headers["Content-Security-Policy"], /script-src 'self'/);
});
