// Sincronización de las tareas de un estudiante.
//
// El teléfono guarda las tareas y manda lo que tiene: {"courseId/courseWorkId": huella}.
// El servidor revisa con Google solo lo ligero (ids, fechas y estados), compara y
// devuelve únicamente lo nuevo, lo modificado y lo que ya no existe. Las tareas
// salen con la misma forma JSON de Google, para que la app les aplique sus
// funciones de siempre (setCourseName, joinAssigments, creatDateTime).
// No se guarda nada de Classroom en Firebase.

const {listAll} = require("./google");

const MAX_WEEKS = 60; // máximo del filtro de semanas de la app
const CONCURRENCY = 4;
const MAX_KNOWN = 10000;

function workKey(courseId, workId) {
  return `${courseId}/${workId}`;
}

function fingerprint(updateTime, submission) {
  return [updateTime, submission.state || "", submission.updateTime || ""].join("|");
}

// Lo que manda el teléfono. Si viene dañado, se ignora y se descarga todo.
function sanitizeKnown(known) {
  if (!known || typeof known !== "object" || Array.isArray(known)) return {};
  const entries = Object.entries(known);
  if (entries.length > MAX_KNOWN) return {};
  const clean = {};
  for (const [key, value] of entries) {
    if (typeof value === "string" && key.includes("/")) clean[key] = value;
  }
  return clean;
}

async function mapLimit(items, limit, fn) {
  const results = new Array(items.length);
  let next = 0;
  async function worker() {
    while (next < items.length) {
      const index = next++;
      results[index] = await fn(items[index]);
    }
  }
  await Promise.all(Array.from({length: Math.min(limit, items.length)}, worker));
  return results;
}

async function syncCourse({course, known, google, since}) {
  const courseId = encodeURIComponent(course.id);
  const summary = {id: course.id, name: course.name || "", ok: true};

  const [works, submissions] = await Promise.all([
    google({
      path: `/courses/${courseId}/courseWork`,
      params: {fields: "courseWork(id,updateTime,creationTime),nextPageToken"},
      listKey: "courseWork",
    }),
    google({
      path: `/courses/${courseId}/courseWork/-/studentSubmissions`,
      params: {fields: "studentSubmissions(id,courseWorkId,state,updateTime),nextPageToken"},
      listKey: "studentSubmissions",
    }),
  ]);

  // Si el curso falla, sus tareas guardadas en el teléfono se conservan.
  if (!works.ok || !submissions.ok) {
    const errorCode = works.ok ? submissions.status : works.status;
    return {course: {...summary, ok: false, errorCode}, changed: [], removed: []};
  }

  const submissionByWork = new Map();
  for (const sub of submissions.items) {
    if (sub && sub.courseWorkId && !submissionByWork.has(sub.courseWorkId)) {
      submissionByWork.set(sub.courseWorkId, sub);
    }
  }

  const current = new Map();
  for (const work of works.items) {
    if (!work || !work.id) continue;
    const submission = submissionByWork.get(work.id);
    if (!submission) continue; // no está asignada a este estudiante
    const updateTime = work.updateTime || work.creationTime;
    const time = Date.parse(updateTime || "");
    if (Number.isNaN(time)) continue; // sin fecha válida, setCourseName fallaría
    if (time < since) continue; // fuera del rango máximo del filtro
    current.set(workKey(course.id, work.id), {
      fingerprint: fingerprint(updateTime, submission),
      submission,
      updateTime,
    });
  }

  const prefix = `${course.id}/`;
  const removed = Object.keys(known).filter((k) => k.startsWith(prefix) && !current.has(k));
  const changedKeys = [...current.keys()].filter((k) => known[k] !== current.get(k).fingerprint);
  if (changedKeys.length === 0) return {course: summary, changed: [], removed};

  const full = await google({path: `/courses/${courseId}/courseWork`, listKey: "courseWork"});
  if (!full.ok) {
    return {course: {...summary, ok: false, errorCode: full.status}, changed: [], removed: []};
  }

  const wanted = new Set(changedKeys);
  const changed = [];
  for (const work of full.items) {
    if (!work || !work.id) continue;
    const key = workKey(course.id, work.id);
    if (!wanted.has(key)) continue;
    const info = current.get(key);
    changed.push({
      ...work,
      courseId: course.id,
      updateTime: info.updateTime,
      studentSubmission: {
        id: info.submission.id,
        state: info.submission.state || null,
        updateTime: info.submission.updateTime || null,
      },
      fingerprint: info.fingerprint,
    });
  }
  return {course: summary, changed, removed};
}

async function syncStudent({known, token, fetchImpl, sleep, now}) {
  const google = (args) => listAll({...args, token, fetchImpl, sleep});
  const since = now() - MAX_WEEKS * 7 * 24 * 60 * 60 * 1000;

  const courses = await google({
    path: "/courses",
    params: {fields: "courses(id,name),nextPageToken"},
    listKey: "courses",
  });
  if (!courses.ok) return {ok: false, status: courses.status};

  const validCourses = courses.items.filter((c) => c && c.id);
  const results = await mapLimit(validCourses, CONCURRENCY, (course) =>
    syncCourse({course, known, google, since}),
  );

  // Tareas de cursos que ya no aparecen (el estudiante salió del curso).
  const courseIds = new Set(validCourses.map((c) => `${c.id}/`));
  const removedFromGoneCourses = Object.keys(known).filter(
    (k) => ![...courseIds].some((prefix) => k.startsWith(prefix)),
  );

  return {
    ok: true,
    status: 200,
    body: {
      courses: results.map((r) => r.course),
      changed: results.flatMap((r) => r.changed),
      removed: results.flatMap((r) => r.removed).concat(removedFromGoneCourses),
      complete: results.every((r) => r.course.ok),
    },
  };
}

function apiError(code, status, message) {
  return {error: {code, status, message}};
}

function createSyncHandler({auth, db, accessTokenFor, fetchImpl, logger, sleep, now = Date.now}) {
  return async function sync(req, res) {
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

    const snap = await db.collection("students").doc(studentId).get();
    const student = snap.exists ? snap.data() : null;
    if (!student || !Array.isArray(student.users_uids) || !student.users_uids.includes(uid)) {
      return res.status(403).json(apiError(403, "PERMISSION_DENIED", "STUDENT_NOT_LINKED"));
    }

    const refreshToken = student.google_refresh_token;
    if (typeof refreshToken !== "string" || !refreshToken || refreshToken === "null") {
      return res.status(401).json(apiError(401, "UNAUTHENTICATED", "RECONNECT_REQUIRED"));
    }

    let token;
    try {
      token = await accessTokenFor(studentId, refreshToken);
    } catch (e) {
      logger.warn("sync: token refresh failed", {studentId, reason: e.message});
      if (e.reconnect) {
        return res.status(401).json(apiError(401, "UNAUTHENTICATED", "RECONNECT_REQUIRED"));
      }
      return res.status(503).json(apiError(503, "UNAVAILABLE", "TOKEN_REFRESH_FAILED"));
    }

    const result = await syncStudent({known: sanitizeKnown(body.known), token, fetchImpl, sleep, now});
    if (!result.ok) {
      logger.warn("sync: courses unavailable", {studentId, status: result.status});
      const code = result.status === 401 ? 401 : 503;
      const message = result.status === 401 ? "RECONNECT_REQUIRED" : "CLASSROOM_UNAVAILABLE";
      return res.status(code).json(apiError(code, "UNAVAILABLE", message));
    }

    const failed = result.body.courses.filter((c) => !c.ok);
    logger.info("sync: done", {
      studentId,
      courses: result.body.courses.length,
      failedCourses: failed.map((c) => c.errorCode),
      changed: result.body.changed.length,
      removed: result.body.removed.length,
    });
    return res.status(200).json(result.body);
  };
}

module.exports = {sanitizeKnown, syncStudent, createSyncHandler, MAX_WEEKS};
