// Páginas que ve el estudiante al terminar. Mismos textos, imagen, confeti y
// fuente (Inter Tight) que la página anterior de FlutterFlow; todo se sirve
// desde el mismo dominio (Firebase Hosting, carpeta /cr).

function layout(body, {confetti}) {
  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Class Retriever</title>
<style>
  @font-face {
    font-family: 'Inter Tight';
    font-style: normal;
    font-weight: 400;
    font-display: swap;
    src: url('/cr/InterTight-Regular.woff2') format('woff2');
  }
  html, body { margin: 0; height: 100%; background: #ffffff; }
  body {
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Inter Tight', system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
  }
  /* El confeti va encima del perro y del texto, como en la página anterior. */
  #animation { position: fixed; inset: 0; z-index: 2; pointer-events: none; }
  main {
    position: relative;
    z-index: 1;
    width: 100%;
    max-width: 800px;
    padding: 24px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 120px;
    text-align: center;
  }
  main img { display: block; width: 200px; height: 200px; border-radius: 8px; object-fit: cover; }
  .message { margin: 0; color: #000000; font-size: 20px; font-weight: 400; line-height: 1.5; white-space: pre-line; }
</style>
</head>
<body>
${confetti ? `<div id="animation" data-animation="/cr/confetti.json" data-loop="true"></div>` : ""}
<main>
${body}
</main>
${confetti ? `<script src="/cr/lottie_light.min.js"></script>\n<script src="/cr/page.js"></script>` : ""}
</body>
</html>`;
}

// Igual que la página "oauthland": el perro con gorro, el mensaje y el
// confeti en toda la pantalla. Se usa también cuando el estudiante ya estaba
// conectado, para que se vea igual en los dos casos.
function connectedPage() {
  return layout(`<img src="/cr/dog_with_party_hat.png" alt="">
<p class="message">Hooray!
Your connection is now active!
Welcome aboard!</p>`, {confetti: true});
}

function alreadyConnectedPage() {
  return connectedPage();
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
  return layout(`<p class="message">${message}</p>`, {confetti: false});
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
      "font-src 'self'; connect-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'none'",
  );
  res.set("Content-Type", "text/html; charset=utf-8");
  return res.status(status).send(html);
}

module.exports = {connectedPage, alreadyConnectedPage, errorPage, sendPage, ERROR_MESSAGES};
