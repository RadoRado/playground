var
  _ = require("lodash"),
  app = require('express')(),
  http = require('http').Server(app),
  io = require('socket.io')(http),
  bodyParser = require("body-parser");

var gameData = {}; // socketId (host) -> {gameId, player2 (socketId)}
var reverseGameData = {}; // gameId -> host
var connectedClients = {}; // socketId -> socket

function socketConnected(socket) {
  console.log("Socket with id: " + socket.id + " connected");
  connectedClients[socket.id] = socket;
}

function socketDisconected(socketId) {
  // remove client from the socketId

  if(connectedClients[socketId]) {
    delete connectedClients[socketId];
  }

  Object.keys(gameData).forEach(function(gameId) {
    var players = gameData[gameId];

    if(players.player1 === socketId) {
      // notify player 2
    } else if(players.player2 === socketId) {
      // notify player 1
    }
  });
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
        gameId: gameId
      }
    }

    res.json({
      gameId: gameId
    });
});

app.post("/joinGame", function(req, res) {
  var
    playerName = req.body.playerName,
    socketId = req.body.socketId,
    gameId = req.body.gameId;


});

http.listen(3000, function(){
  console.log('listening on *:3000');
});
