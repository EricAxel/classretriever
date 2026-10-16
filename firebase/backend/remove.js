// Quitar a un estudiante de la cuenta de un padre.
//
// Antes la app intentaba borrar el documento y las reglas de Firestore lo
// impedían. Ahora:
// - Si el estudiante tiene otros padres vinculados, solo se quita a este padre.
// - Si era el último, se borra el estudiante y sus documentos de `tokens`, y se
//   revoca el permiso en Google, salvo que otro registro use el mismo token
//   (revocar corta el permiso completo de ese estudiante).

const REVOKE_URL = "https://oauth2.googleapis.com/revoke";

function apiError(code, status, message) {
  return {error: {code, status, message}};
}

function usableToken(token) {
  return typeof token === "string" && token !== "" && token !== "null";
}

function createRemoveStudentHandler({auth, db, arrayRemove, fetchImpl, logger}) {
  return async function removeStudent(req, res) {
    res.set("Cache-Control", "private, no-store");

    if (req.method !== "POST") {
      return res.status(405).json(apiError(405, "METHOD_NOT_ALLOWED", "Use POST"));
    }

    const header = req.get("Authorization") || "";
    const idToken = header.startsWith("Bearer ") ? header.slice(7) : "";
    let uid;
    try {
      uid = (await auth.verifyIdToken(idToken)).uid;
    } catch (e) {
      return res.status(401).json(apiError(401, "UNAUTHENTICATED", "INVALID_SESSION"));
    }

    const body = req.body && typeof req.body === "object" ? req.body : {};
    const studentId = typeof body.studentId === "string" ? body.studentId : "";
    if (!studentId || studentId.includes("/")) {
      return res.status(400).json(apiError(400, "INVALID_ARGUMENT", "STUDENT_ID_REQUIRED"));
    }

    const ref = db.collection("students").doc(studentId);
    let outcome;
    try {
      outcome = await db.runTransaction(async (tx) => {
        const snap = await tx.get(ref);
        const student = snap.exists ? snap.data() : null;
        const parents = student && Array.isArray(student.users_uids) ? student.users_uids : [];
        if (!parents.includes(uid)) return {status: "not_linked"};

        if (parents.some((p) => p !== uid)) {
          tx.update(ref, {users_uids: arrayRemove(uid)});
          return {status: "unlinked"};
        }
        tx.delete(ref);
        return {status: "deleted", refreshToken: student.google_refresh_token};
      });
    } catch (e) {
      logger.warn("removeStudent: transaction failed", {studentId});
      return res.status(503).json(apiError(503, "UNAVAILABLE", "REMOVE_FAILED"));
    }

    if (outcome.status === "not_linked") {
      return res.status(403).json(apiError(403, "PERMISSION_DENIED", "STUDENT_NOT_LINKED"));
    }

    let revoked = false;
    if (outcome.status === "deleted" && usableToken(outcome.refreshToken)) {
      const token = outcome.refreshToken;
      try {
        const tokenDocs = await db.collection("tokens").where("refreshtoken", "==", token).get();
        if (!tokenDocs.empty) {
          const batch = db.batch();
          tokenDocs.docs.forEach((d) => batch.delete(d.ref));
          await batch.commit();
        }

        const others = await db.collection("students")
          .where("google_refresh_token", "==", token).limit(1).get();
        if (others.empty) {
          const r = await fetchImpl(REVOKE_URL, {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({token}),
          });
          // 400 significa que ya estaba revocado o caducado: no es un error.
          revoked = r.ok || r.status === 400;
        }
      } catch (e) {
        // El estudiante ya se quitó; la limpieza se registra para revisarla.
        logger.warn("removeStudent: cleanup incomplete", {studentId});
      }
    }

    logger.info("removeStudent: done", {studentId, status: outcome.status, revoked});
    return res.status(200).json({status: outcome.status, revoked});
  };
}

module.exports = {createRemoveStudentHandler};
