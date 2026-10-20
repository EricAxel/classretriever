// Conexión del estudiante (reemplaza la página de FlutterFlow y los flujos
// de BuildShip previousconnection, adduid y tokenExchangeGoogleOauth).
//
// Paso a paso del estudiante, igual que hoy:
//   1. Escanea el QR del padre -> /connect?data=AX0{uid}AX1{nombre}AX2{email}AX3{qr}AX4
//   2. Si ya estaba conectado y su permiso sigue vivo: se añade el padre y ve
//      «Hooray!» (como previousconnection + adduid).
//      Si no: va a la pantalla de permiso de Google.
//   3. Google vuelve a /callback: se guarda el permiso y ve «Hooray!».
//
// En `students` se escriben los mismos 5 campos que escribe hoy BuildShip:
// email, google_refresh_token, google_token, student_given_name, users_uids.
// El email se guarda tal como lo escribió el padre, porque la pantalla del QR
// lo busca con ese valor exacto.

const crypto = require("crypto");
const {connectedPage, alreadyConnectedPage, errorPage, sendPage} = require("./pages");

const AUTH_URL = "https://accounts.google.com/o/oauth2/v2/auth";
const SCOPES = [
  "https://www.googleapis.com/auth/classroom.courses.readonly",
  "https://www.googleapis.com/auth/classroom.course-work.readonly",
  "https://www.googleapis.com/auth/classroom.student-submissions.me.readonly",
];
const STATE_TTL_MS = 30 * 60 * 1000;
const UID_RE = /^[A-Za-z0-9]{10,128}$/;
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const QR_ID_RE = /^[A-Za-z0-9]{1,64}$/;

function between(text, start, end) {
  const i = text.indexOf(start);
  if (i < 0) return null;
  const j = text.indexOf(end, i + start.length);
  if (j < 0) return null;
  return text.slice(i + start.length, j);
}

// Lee los datos del QR. Devuelve null si no son válidos.
function parseConnectData(data) {
  if (typeof data !== "string" || data.length > 2000) return null;
  const uid = between(data, "AX0", "AX1");
  const name = between(data, "AX1", "AX2") || "";
  const email = between(data, "AX2", "AX3");
  const qrId = between(data, "AX3", "AX4") || "";
  if (!uid || !UID_RE.test(uid)) return null;
  if (!email || email.length > 254 || !EMAIL_RE.test(email.trim())) return null;
  return {
    uid,
    // Igual que cleanName de la página anterior: "%20" -> espacio.
    name: name.replace(/%20/g, " ").replace(/\s+/g, " ").trim().slice(0, 100),
    email,
    qrId: QR_ID_RE.test(qrId) ? qrId : "",
  };
}

function usableToken(token) {
  return typeof token === "string" && token !== "" && token !== "null";
}

// Busca al estudiante por el email exacto. Si hay varios, prefiere el que ya
// tiene a este padre.
async function findStudent(db, email, uid) {
  const snap = await db.collection("students").where("email", "==", email).limit(10).get();
  if (snap.empty) return null;
  const docs = snap.docs.map((d) => ({id: d.id, ref: d.ref, data: d.data() || {}}));
  return docs.find((d) => (d.data.users_uids || []).includes(uid)) || docs[0];
}

function authorizationUrl({clientId, redirectUri, state}) {
  const params = new URLSearchParams({
    client_id: clientId,
    redirect_uri: redirectUri,
    response_type: "code",
    scope: SCOPES.join(" "),
    access_type: "offline",
    prompt: "consent",
    include_granted_scopes: "true",
    state,
  });
  return `${AUTH_URL}?${params}`;
}

function createConnectHandler({db, accessTokenFor, arrayUnion, clientId, redirectUri, logger,
  now = Date.now, randomState = () => crypto.randomBytes(24).toString("hex")}) {
  return async function connect(req, res) {
    if (req.method !== "GET") return sendPage(res, 405, errorPage("invalid_link"));

    const info = parseConnectData(req.query.data);
    if (!info) return sendPage(res, 400, errorPage("invalid_link"));

    try {
      const existing = await findStudent(db, info.email, info.uid);
      if (existing && usableToken(existing.data.google_refresh_token)) {
        try {
          // El permiso guardado sigue vivo: se añade el padre sin volver a pedirlo.
          await accessTokenFor(existing.id, existing.data.google_refresh_token);
          if (!(existing.data.users_uids || []).includes(info.uid)) {
            await existing.ref.update({users_uids: arrayUnion(info.uid)});
          }
          logger.info("connect: already connected", {studentId: existing.id});
          return sendPage(res, 200, alreadyConnectedPage());
        } catch (e) {
          logger.info("connect: stored permission unusable, asking again", {studentId: existing.id});
        }
      }

      const state = randomState();
      await db.collection("oauth_states").doc(state).set({
        ...info,
        createdAt: now(),
        expiresAt: now() + STATE_TTL_MS,
      });
      res.set("Cache-Control", "no-store");
      res.set("Referrer-Policy", "no-referrer");
      return res.redirect(302, authorizationUrl({clientId, redirectUri, state}));
    } catch (e) {
      logger.warn("connect: failed", {reason: e.message});
      return sendPage(res, 503, errorPage("failed"));
    }
  };
}

function createCallbackHandler({db, exchange, arrayUnion, logger, now = Date.now}) {
  return async function callback(req, res) {
    if (req.method !== "GET") return sendPage(res, 405, errorPage("failed"));

    const state = typeof req.query.state === "string" ? req.query.state : "";
    const code = typeof req.query.code === "string" ? req.query.code : "";
    const googleError = typeof req.query.error === "string" ? req.query.error : "";
    if (!state || state.length > 100 || state.includes("/")) {
      return sendPage(res, 400, errorPage("invalid_link"));
    }

    try {
      // El state se usa una sola vez.
      const stateRef = db.collection("oauth_states").doc(state);
      const snap = await stateRef.get();
      if (!snap.exists) return sendPage(res, 400, errorPage("expired"));
      await stateRef.delete();
      const info = snap.data();
      if (!info || !(info.expiresAt > now())) return sendPage(res, 400, errorPage("expired"));

      if (googleError) {
        logger.info("callback: google returned error", {error: googleError});
        return sendPage(res, 200, errorPage(googleError === "access_denied" ? "denied" : "failed"));
      }
      if (!code) return sendPage(res, 400, errorPage("invalid_link"));

      const result = await exchange(code);
      if (!result.ok) {
        logger.warn("callback: code exchange failed", {reason: result.reason});
        return sendPage(res, 200, errorPage("failed"));
      }

      const granted = new Set(String(result.body.scope || "").split(" "));
      if (!SCOPES.every((s) => granted.has(s))) {
        logger.info("callback: missing scopes");
        return sendPage(res, 200, errorPage("missing_scopes"));
      }

      const refreshToken = result.body.refresh_token;
      if (!usableToken(refreshToken)) {
        // Con prompt=consent Google siempre lo envía; nunca se guarda vacío.
        logger.warn("callback: no refresh token");
        return sendPage(res, 200, errorPage("failed"));
      }

      const existing = await findStudent(db, info.email, info.uid);
      if (existing) {
        const update = {
          google_refresh_token: refreshToken,
          google_token: result.body.access_token,
          users_uids: arrayUnion(info.uid),
        };
        if (!existing.data.student_given_name && info.name) update.student_given_name = info.name;
        await existing.ref.update(update);
        logger.info("callback: updated student", {studentId: existing.id});
      } else {
        const ref = await db.collection("students").add({
          email: info.email,
          google_refresh_token: refreshToken,
          google_token: result.body.access_token,
          student_given_name: info.name,
          users_uids: [info.uid],
        });
        logger.info("callback: created student", {studentId: ref.id});
      }
      return sendPage(res, 200, connectedPage());
    } catch (e) {
      logger.warn("callback: failed", {reason: e.message});
      return sendPage(res, 503, errorPage("failed"));
    }
  };
}

module.exports = {
  SCOPES,
  parseConnectData,
  authorizationUrl,
  createConnectHandler,
  createCallbackHandler,
};
