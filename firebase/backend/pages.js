// Páginas que ve el estudiante al terminar. Mismos textos, imagen y
// animaciones que la página anterior de FlutterFlow; todo se sirve desde el
// mismo dominio (Firebase Hosting, carpeta /cr).

const FONT = "'Inter Tight', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif";

function layout(body) {
  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class Retriever</title>
<style>
  html, body { margin: 0; height: 100%; background: #ffffff; }
  body { display: flex; align-items: center; justify-content: center; font-family: ${FONT}; }
  main { width: 100%; max-width: 800px; padding: 24px; box-sizing: border-box; text-align: center; }
  .stage { position: relative; display: flex; align-items: center; justify-content: center; }
  .message { color: #000000; white-space: pre-line; line-height: 1.5; margin: 0; }
</style>
</head>
<body>
<main>
${body}
</main>
<script src="/cr/lottie_light.min.js"></script>
<script src="/cr/page.js"></script>
</body>
</html>`;
}

// Igual que la página "oauthland": confeti, el perro con gorro y el mensaje.
function connectedPage() {
  return layout(`<div class="stage" style="height: 28.9vh; margin-bottom: 50px;">
  <div id="animation" data-animation="/cr/confetti.json" data-loop="true" style="position: absolute; inset: 0;"></div>
  <img src="/cr/dog_with_party_hat.png" alt="" width="200" height="200" style="position: relative; border-radius: 8px; object-fit: cover;">
</div>
<p class="message" style="font-size: 20px; font-weight: 400;">Hooray!
Your connection is now active!
Welcome aboard!</p>`);
}

// Igual que la página "newconexion" (el estudiante ya estaba conectado).
function alreadyConnectedPage() {
  return layout(`<div class="stage" style="margin-bottom: 24px;">
  <div id="animation" data-animation="/cr/rocket.json" data-loop="false" style="width: 150px; height: 130px;"></div>
</div>
<p class="message" style="font-size: 18px; font-weight: 500;">🚀 Hooray!
Your connection is now active!
Welcome aboard! 🎊</p>`);
}

const ERROR_MESSAGES = {
  invalid_link: "This connection link is not valid.\nPlease scan the QR code again.",
  expired: "This connection link has expired.\nPlease scan the QR code again.",
  denied: "The connection was not completed.\nPlease scan the QR code again and allow access.",
  missing_scopes: "The connection was not completed.\nPlease scan the QR code again and check all the boxes when Google asks what Class Retriever can access.",
  failed: "We couldn't complete the connection.\nPlease scan the QR code again.",
};

function errorPage(kind) {
  const message = ERROR_MESSAGES[kind] || ERROR_MESSAGES.failed;
  return layout(`<p class="message" style="font-size: 18px; font-weight: 400;">${message}</p>`);
}

// Cabeceras de seguridad comunes. Sin referrer, para que el código de Google
// de la URL no se envíe a ningún otro sitio.
function sendPage(res, status, html) {
  res.set("Cache-Control", "no-store");
  res.set("Referrer-Policy", "no-referrer");
  res.set("X-Frame-Options", "DENY");
  res.set("X-Content-Type-Options", "nosniff");
  res.set(
    "Content-Security-Policy",
    "default-src 'self'; img-src 'self' data:; script-src 'self'; style-src 'self' 'unsafe-inline'; " +
      "connect-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'none'",
  );
  res.set("Content-Type", "text/html; charset=utf-8");
  return res.status(status).send(html);
}

module.exports = {connectedPage, alreadyConnectedPage, errorPage, sendPage, ERROR_MESSAGES};
