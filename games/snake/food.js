window.Food = (function(window, undefined){
  var
    point = {
      x: 0,
      y: 0
    },
    size = 0,
    canvasSize = {
      width: 0,
      height: 0
    };

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function init(foodSize, width, height) {
      size = foodSize;
      canvasSize.width = width;
      canvasSize.height = height;
    }

    function getSize() {
      return size;
    }

    function getPoint() {
      // return a clone of the point
      return JSON.parse(JSON.stringify(point));
    }

    function create() {
      point.x = getRandomInt(0, canvasSize.width / size);
      point.y = getRandomInt(0, canvasSize.height / size);
      console.log(point);
    }

    return {
      init: init,
      create: create,
      getSize: getSize,
      getPoint: getPoint
    }
} (window));
