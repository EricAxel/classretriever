// Reproduce la animación indicada en data-animation (mismas animaciones que
// la página anterior de FlutterFlow, servidas desde este dominio).
(function () {
  var box = document.getElementById("animation");
  if (!box || !window.lottie) return;
  window.lottie.loadAnimation({
    container: box,
    renderer: "svg",
    loop: box.getAttribute("data-loop") === "true",
    autoplay: true,
    path: box.getAttribute("data-animation"),
  });
})();
