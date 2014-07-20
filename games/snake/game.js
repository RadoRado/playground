window.Game =
(function(window, undefined) {
  var
    TILE_SIZE = 10,
    canvas = null,
    context = null,
    frameSpeed = null,
    gameLoopIntervalId = null,
    snakes = [],
    food = window.Food,
    keyCodesToDirection = {
      38: "up",
      87: "up",
      40: "down",
      83: "down",
      37: "left",
      72: "left",
      37: "right",
      65: "right"
    },
    playing = false,
    PLAYER_1 = "player1",
    PLAYER_2 = "player2",
    currentPlayer = PLAYER_1;

  function getSnakeForPlayer() {
    if(currentPlayer === PLAYER_1) {
      return snakes[0];
    }

    return snakes[1];
  }

  function init(cnvs, fs, player) {
    canvas = cnvs;
    context = canvas.getContext("2d");
    frameSpeed = fs;
    currentPlayer = player;

    // player1 snake
    snakes.push(new Snake(TILE_SIZE, 5, "red", 0));

    // player2 snake
    snakes.push(new Snake(TILE_SIZE, 5, "blue", 100 / TILE_SIZE));

    food.init(10, canvas.width, canvas.height);
    createNewFood();
  }

  function start() {
    var that = this;
    playing = true;
    gameLoopIntervalId = setInterval(function() {
      gameLoop.call(that);
    }, frameSpeed);
  }

  function stop() {
    playing = false;
    clearInterval(gameLoopIntervalId);
  }

  function toggle() {
    // it is beautiful on the inside
    [this.start, this.stop][+!!playing].call(this);
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
    // context.rect(x, y, size, size);

    context.beginPath();
    context.moveTo(x - (size / 2), y - (size / 2));
    context.lineTo(x + (size / 2), y - (size / 2));
    context.lineTo(x + (size / 2), y + (size / 2));
    context.lineTo(x - (size / 2), y + (size / 2));
    context.closePath();
    context.fill();
  }

  function drawSnake(snake) {
    snake.getSections().forEach(function(section) {
      drawBox(section.x, section.y, snake.getSize(), snake.getColor());
    });
  }

  function createNewFood() {
    food.create();
  }

  function drawFood() {
    var foodPoint = food.getPoint();
    drawBox(foodPoint.x, foodPoint.y, food.getSize(), "blue");
  }

  function clearCanvas() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  function keyPressed(keyCode) {
    if(keyCode === 32) {
      Game.toggle();
      drawText("Game Paused!");
      return;
    }

    var newDirection = keyCodesToDirection[keyCode] || "left";

    getSnakeForPlayer().setDirection(newDirection);
  }

  // this is called every frameSpeed milliseconds
  function gameLoop() {
    clearCanvas();

    drawFood();

    snakes.forEach(function(snake) {
      snake.move();
      drawSnake(snake);

      if(snake.isEatingFood(food.getPoint())) {
        createNewFood();
      }

      if([snake.isEatingOwnTail()].reduce(function(a,  b) {
        return a || b
      }, false)) {
        drawText("Game Over");
        this.stop();
      }
    });
  }

  return {
    init: init,
    start: start,
    stop: stop,
    toggle: toggle,
    keyPressed: keyPressed
  };

} (window) )
