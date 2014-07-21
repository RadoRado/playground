/*globals window, console*/

window.Game =
(function(Snake, undefined) {
  "use strict";
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
      65: "right"
    },
    playing = false,
    PLAYER_1 = "player1",
    PLAYER_2 = "player2",
    currentPlayer = PLAYER_1,
    gameId = null,
    socket = null,
    isHost = null;

  function getSnakeForPlayer(player) {
    if(player === PLAYER_1) {
      return snakes[0];
    } else if(player === PLAYER_2) {
      return snakes[1];
    }
  }

  function init(config) {
    canvas = config.canvas;
    context = canvas.getContext("2d");
    frameSpeed = config.frameSpeed;
    currentPlayer = config.player;
    socket = config.socket;
    gameId = config.gameId;
    isHost = config.isHost;

    socket.on("render", render);

    // player1 snake
    snakes.push(new Snake(TILE_SIZE, 5, "red", 0));

    // player2 snake
    snakes.push(new Snake(TILE_SIZE, 5, "blue", 100 / TILE_SIZE));

    food.init(10, canvas.width, canvas.height);
    createNewFood();
  }

  function start() {
    if(!isHost) {
      return;
    }
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

  function drawSnake(snakeSections, snakeSize, snakeColor) {
    snakeSections.forEach(function(section) {
      drawBox(section.x, section.y, snakeSize, snakeColor);
    });
  }

  function createNewFood() {
    food.create();
  }

  function drawFood(foodPoint) {
    drawBox(foodPoint.x, foodPoint.y, food.getSize(), "blue");
  }

  function clearCanvas() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  function keyPressed(keyCode) {
    if(keyCode === 32) {
      this.toggle();
      drawText("Game Paused!");
      return;
    }

    var newDirection = keyCodesToDirection[keyCode] || "left";

    if(isHost) {
      getSnakeForPlayer(currentPlayer).setDirection(newDirection);
    } else {
      socket.emit("move", {
        gameId: gameId,
        type: "newDirection",
        direction: newDirection,
        from: currentPlayer
      });
    }
  }

  // this is called every frameSpeed milliseconds
  function gameLoop() {
    clearCanvas();
    drawFood(food.getPoint());

    snakes.forEach(function(snake) {
      snake.move();
      drawSnake(snake.getSections(), snake.getSize(), snake.getColor());

      if(snake.isEatingFood(food.getPoint())) {
        createNewFood();
      }

      if([snake.isEatingOwnTail()].reduce(function(a,  b) {
        return a || b;
      }, false)) {
        drawText("Game Over");
        this.stop();
      }
    });

    socket.emit("move", {
      gameId: gameId,
      type: "move",
      from: currentPlayer,
      player1: getSnakeForPlayer("player1").getSections(),
      player2: getSnakeForPlayer("player2").getSections(),
      food: food.getPoint()
    });
  }

  function render(data) {
    // we do not want data from ourselves
    if(data.from === currentPlayer) {
      return;
    }
    var
      p1Snake = getSnakeForPlayer("player1"),
      p2Snake = getSnakeForPlayer("player2");

    clearCanvas();

    switch(data.type) {
      case "move":
        drawFood(data.food)
        drawSnake(data.player1, p1Snake.getSize(), p1Snake.getColor());
        drawSnake(data.player2, p2Snake.getSize(), p2Snake.getColor());
        break;
      case "newDirection":
        p2Snake.setDirection(data.direction);
    }
  }

  return {
    init: init,
    start: start,
    stop: stop,
    toggle: toggle,
    keyPressed: keyPressed
  };

} (window.Snake) );
