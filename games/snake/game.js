window.Game =
(function(window, undefined) {
  var
    canvas = null,
    context = null,
    frameSpeed = null,
    gameLoopIntervalId = null,
    snake = window.Snake;

  function init(cnvs, fs) {
    canvas = cnvs;
    context = canvas.getContext("2d");
    frameSpeed = fs;
    Snake.init(10, 5);
  }

  function start() {
    var that = this;
    gameLoopIntervalId = setInterval(function() {
      gameLoop.call(that);
    }, frameSpeed)
  }

  function stop() {
    console.log(gameLoopIntervalId);
    clearInterval(gameLoopIntervalId);
  }

  function drawBox(x, y, size, color) {
    x *= size;
    y *= size;

    context.fillStyle = color;
    context.beginPath();
    context.moveTo(x - (size / 2), y - (size / 2));
    context.lineTo(x + (size / 2), y - (size / 2));
    context.lineTo(x + (size / 2), y + (size / 2));
    context.lineTo(x - (size / 2), y + (size / 2));
    context.closePath();
    context.fill();
  }

  function drawSnake() {
    snake.getSections().forEach(function(section) {
      drawBox(section.x, section.y, snake.getSize(), "red");
    });
  }

  function moveSnake() {
    Snake.move();
  }

  function clearCanvas() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  function gameLoop() {
    clearCanvas();
    moveSnake();
    drawSnake();
  }

  return {
    init: init,
    start: start,
    stop: stop,
  };

} (window) )
