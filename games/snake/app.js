// plain JS without jQuery

function initOnReady() {
  var
    canvas = document.querySelector("#playCanvas"),
    canvasWigth = document.body.clientWidth / 1.5,
    canvasHeight = document.body.clientHeight / 1.5;

  // make canvas fullscreen
  canvas = fitCanvasTo(canvas, canvasWigth, canvasHeight);

  Game.init(canvas, 60);
  Game.start();

  addEventListener("keydown", function (e) {
    e.preventDefault();

    Game.keyPressed(e.keyCode);
  }, false);
}

function fitCanvasTo(canvas, width, height) {
  canvas.width = width;
  canvas.height = height;

  return canvas;
}

document.addEventListener("DOMContentLoaded", initOnReady, false)
