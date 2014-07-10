// plain JS without jQuery

function initOnReady() {
  var
    canvas = document.querySelector("#playCanvas"),
    canvasWigth = document.body.clientWidth,
    canvasHeight = document.body.clientHeight;

  // make canvas fullscreen
  canvas = fitCanvasTo(canvas, canvasWigth, canvasHeight);

  Game.init(canvas, 1000);
  Game.start();
}

function fitCanvasTo(canvas, width, height) {
  canvas.width = width;
  canvas.height = height;

  return canvas;
}

document.addEventListener("DOMContentLoaded", initOnReady, false)
