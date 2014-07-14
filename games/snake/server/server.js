var
  _ = require("lodash"),
  app = require('express')(),
  http = require('http').Server(app),
  io = require('socket.io')(http),
  bodyParser = require("body-parser");

var gameData = {}; // socketId (host) -> {gameId, player2 (socketId)}
var gameIdToHost = {}; // gameId -> host
var connectedClients = {}; // socketId -> socket

function emitTo(sockets, message, data) {
  sockets.forEach(function(socket) {
    socket.emit(message, data);
  });
}

function socketConnected(socket) {
  console.log("Socket with id: " + socket.id + " connected");
  connectedClients[socket.id] = socket;
}

function socketDisconected(socketId) {
  // remove client from the socketId

  if(connectedClients[socketId]) {
    delete connectedClients[socketId];
  }

  if(gameData[socketId]) {
    var gameId = gameData[socketId].gameId;
    // notify other player
    delete gameData[socketId];
    delete gameIdToHost[gameId];
  }
}

// "{playerName}-{5 letters from socketId} - {random number between 1 and 1000}"
function createGameId(playerName, socketId) {
  return [playerName.toString(), socketId.substring(0, 5), _.random(1, 1000).toString()].join("-");
}

io.on('connection', function(socket){
  socketConnected(socket);

  socket.on("disconnect", function() {
    socketDisconected(this.id);
  });
});

// HTTP PART DOWN THERE

app.all("*", function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", ["X-Requested-With", "Content-Type", "Access-Control-Allow-Methods"]);
  res.header("Access-Control-Allow-Methods", ["DELETE"]);
  next();
});

app.use(bodyParser.json());

app.get("/", function(req, res) {
  res.send("HELLO!");
});

app.post("/createGame", function(req, res) {
  var
    playerName = req.body.playerName,
    socketId = req.body.socketId,
    gameId = null;

    // already hosted a game
    if(gameData[socketId]) {
      gameId = gameData[socketId].gameId;
    } else {
      // host new game
      gameId = createGameId(playerName, socketId);
      gameData[socketId] = {
        playerName: playerName,
        gameId: gameId
      }
      gameIdToHost[gameId] = socketId;
    }

    res.json({
      gameId: gameId
    });
});

app.post("/joinGame", function(req, res) {
  var
    playerName = req.body.playerName,
    socketId = req.body.socketId,
    gameId = req.body.gameId,
    host = null;

    console.log(gameIdToHost);

    if(gameIdToHost[gameId]) {
      // this game is hosted
      host = gameIdToHost[gameId];
      gameData[host].player2 = socketId;

      emitTo([connectedClients[host], connectedClients[socketId]], "start", {
        player1: gameData[host].playerName,
        player2: playerName
      });
      res.json({
        status: "SUCCESS"
      });
    } else {
      res.json({
        "error": "This game is not hosted"
      });
    }

});

http.listen(3000, function(){
  console.log('listening on *:3000');
});
