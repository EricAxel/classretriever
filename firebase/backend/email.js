// Correo de ayuda del onboarding (Loops), enviado desde el servidor.
// Antes la app llamaba a Loops directamente con la clave dentro del código.
// Solo se envía al email del padre con sesión iniciada.

const LOOPS_URL = "https://app.loops.so/api/v1/transactional";
const ONBOARDING_HELP_ID = "cm7to91is02kt12wcvet5u20t";

function apiError(code, status, message) {
  return {error: {code, status, message}};
}

function createOnboardingEmailHandler({auth, loopsKey, fetchImpl, logger}) {
  return async function onboardingEmail(req, res) {
    res.set("Cache-Control", "private, no-store");

    if (req.method !== "POST") {
      return res.status(405).json(apiError(405, "METHOD_NOT_ALLOWED", "Use POST"));
    }

    const header = req.get("Authorization") || "";
    const idToken = header.startsWith("Bearer ") ? header.slice(7) : "";
    let sessionEmail;
    try {
      sessionEmail = (await auth.verifyIdToken(idToken)).email || "";
    } catch (e) {
      return res.status(401).json(apiError(401, "UNAUTHENTICATED", "INVALID_SESSION"));
    }

    const body = req.body && typeof req.body === "object" ? req.body : {};
    const email = typeof body.email === "string" ? body.email.trim() : "";
    const firstName = typeof body.firstName === "string" ? body.firstName.trim().slice(0, 100) : "";

    // Igual que antes: sin email, Loops rechazaba el envío.
    if (!email) {
      return res.status(400).json(apiError(400, "INVALID_ARGUMENT", "EMAIL_REQUIRED"));
    }
    if (!sessionEmail || email.toLowerCase() !== sessionEmail.toLowerCase()) {
      return res.status(403).json(apiError(403, "PERMISSION_DENIED", "EMAIL_NOT_SESSION"));
    }

    let loops;
    try {
      loops = await fetchImpl(LOOPS_URL, {
        method: "POST",
        headers: {
          "Authorization": `Bearer ${loopsKey()}`,
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          transactionalId: ONBOARDING_HELP_ID,
          email,
          dataVariables: {first_name: firstName},
        }),
      });
    } catch (e) {
      logger.warn("onboardingEmail: Loops unreachable");
      return res.status(503).json(apiError(503, "UNAVAILABLE", "EMAIL_PROVIDER_UNAVAILABLE"));
    }

    if (!loops.ok) {
      logger.warn("onboardingEmail: Loops error", {status: loops.status});
      return res.status(502).json(apiError(502, "UNAVAILABLE", "EMAIL_NOT_SENT"));
    }
    return res.status(200).json({success: true});
  };
}

module.exports = {createOnboardingEmailHandler, ONBOARDING_HELP_ID};
