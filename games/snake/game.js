window.Game =
(function(window, undefined) {
  var
    canvas = null,
    context = null,
    frameSpeed = null,
    gameLoopIntervalId = null,
    snake = window.Snake,
    keyCodesToDirection = {
      38: "up",
      87: "up",
      40: "down",
      83: "down",
      37: "left",
      72: "left",
      37: "right",
      65: "right"
    };

  function init(cnvs, fs) {
    canvas = cnvs;
    context = canvas.getContext("2d");
    frameSpeed = fs;
    Snake.init(10, 20);
  }

  function start() {
    var that = this;
    gameLoopIntervalId = setInterval(function() {
      gameLoop.call(that);
    }, frameSpeed)
  }

  function stop() {
    clearInterval(gameLoopIntervalId);
  }

  function drawText(text) {
    var
      x = canvas.width / 2 - text.length * 30 / 2,
      y = canvas.height / 2;

    context.fillStyle = "#000";
    context.font = "30px Arial";
    context.fillText(text, x, y);
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

  function clearCanvas() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  function keyPressed(keyCode) {
    console.log(keyCode);
    var newDirection = keyCodesToDirection[keyCode] || "left";
    snake.setDirection(newDirection);
  }

  function gameLoop() {
    clearCanvas();

    snake.move();
    drawSnake();

    if(snake.isEatingOwnTail()) {
      drawText("Game Over");
      this.stop();
    }
  }

  return {
    init: init,
    start: start,
    stop: stop,
    keyPressed: keyPressed
  };

} (window) )
