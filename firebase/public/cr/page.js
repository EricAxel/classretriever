// Confeti en toda la pantalla, como la página anterior de FlutterFlow
// (la animación cubre el espacio sin deformarse).
(function () {
  var box = document.getElementById("animation");
  if (!box || !window.lottie) return;
  window.lottie.loadAnimation({
    container: box,
    renderer: "svg",
    loop: box.getAttribute("data-loop") === "true",
    autoplay: true,
    path: box.getAttribute("data-animation"),
    rendererSettings: {preserveAspectRatio: "xMidYMid slice"},
  });
})();
