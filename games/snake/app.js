$(document).ready(function() {
    var
      socket = null,
      socketId = null,
      gameId = null,
      serverUrl = null;

  // hide canvas until socket connection
  $("#playCanvas").hide();
  $("#waitingForPlayer").hide();

  $("#connectToSocketServer").on("click", function() {
    serverUrl = $("#socketServerUrl").val();
    socket = new io(serverUrl);

    socket.on("connect", function() {
      console.log("socket ready");
      socketId = socket.io.engine.id;
    });

    socket.on("start", function(data) {
      $("#menuControls").hide();
      $("#waitingForPlayer").hide();
      $("#playCanvas").show();
      startGame();
    });

    socket.on("game_disconnected", function() {
      alert("Game disconnected!");
    });
  });

  $("#createGameButton").on("click", function() {
      $.ajax({
          url: serverUrl + "/createGame",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
              playerName: $("#playerName").val(),
              socketId: socketId
          })
      }).done(function(result) {
          gameId = result.gameId;
          $("#menuControls").hide();
          $("#waitingForPlayer").show();
          $("#gameId").html(gameId);
          console.log("Game is created with id: ", gameId);
      });
  });

  $("#joinGameButton").on("click", function() {
      gameId = $("#joinGameId").val();
      $.ajax({
          url: serverUrl + "/joinGame",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
              playerName: $("#playerName").val(),
              socketId: socketId,
              gameId: gameId
          })
      }).done(function(result) {
          console.log(result);
      });
  });

  function startGame() {
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

});
