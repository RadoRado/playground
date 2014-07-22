$(document).ready(function() {
    var
      socket = null,
      socketId = null,
      gameId = null,
      serverUrl = null,
      isHost = false;

  // hide canvas until socket connection
  $("#playCanvas").hide();
  $("#waitingForPlayer").hide();

  $("#connectToSocketServer").on("click", function() {
    serverUrl = $("#socketServerUrl").val();

    if(!socket) {
      socket = new io(serverUrl);

      socket.on("connect", function() {
        console.log("socket ready");
        socketId = socket.io.engine.id;
      });

      socket.on("start", function(data) {
        $("#menuControls").hide();
        $("#waitingForPlayer").hide();
        $("#playCanvas").show();
        startGame(isHost, socket);
      });

      socket.on("game_disconnected", function() {
        alert("Game disconnected!");
      });
    }
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
          isHost = true;
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

  function startGame(isHost, socket) {
    var
      canvas = document.querySelector("#playCanvas"),
      canvasWigth = document.body.clientWidth / 1.5,
      canvasHeight = document.body.clientHeight / 1.5;

    // make canvas fullscreen
    canvas = fitCanvasTo(canvas, canvasWigth, canvasHeight);

    Game.init({
      canvas: canvas,
      frameSpeed: 500,
      player: isHost? "player1" : "player2",
      isHost: isHost,
      gameId : gameId,
      socket: socket
    });

    Game.start();
    console.log("Just started the game");

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
