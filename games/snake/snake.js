window.Snake =
(function(window, undefined) {
  var
    snakeSize = 0, // how many pixels for one section
    sections = [],  // head is the last element
    direction = "left", // default direction
    allowedDirections = {
      "left": ["up", "down"],
      "right": ["up", "down"],
      "up": ["left", "right"],
      "down": ["left", "right"]
    };

  function init(size, sectionsForStart) {
    snakeSize = size;

    var startSection = 0;

    while(startSection <= sectionsForStart) {
      sections.push({
        x: startSection,
        y: 0
      });

      startSection += 1;
    }
  }

  function getSize() {
    return snakeSize;
  }

  function getSections() {
    // return copy
    return sections.slice();
  }

  function setDirection(newDirection) {
    if(allowedDirections[direction].indexOf(newDirection) !== -1) {
      direction = newDirection;
      return true;
    }

    return false;
  }

  function isEatingOwnTail() {
    var
      headIndex = sections.length - 1,
      head = sections[headIndex],
      result = false;

    sections.slice(0, headIndex).forEach(function(section) {
      if(head.x === section.x && head.y === section.y) {
        result = true;
        return false;
      }
    });

    return result;
  }

  function isEatingFood(foodPoint) {
    var
      headIndex = sections.length - 1,
      head = sections[headIndex];

    if(head.x === foodPoint.x && head.y === foodPoint.y) {
      sections.unshift(foodPoint);
      move();
      return true;
    }

    return false;
  }

  function move() {
    // we take the tail, make it with head coordinates
    // then update it and put it as the new head
    var tail = sections.shift();

    tail.x = sections[sections.length - 1].x
    tail.y = sections[sections.length - 1].y

    switch(direction) {
      case "left":
        tail.x += 1 ;
        break;
      case "right":
        tail.x -= 1 ;
        break;
      case "down":
        tail.y += 1 ;
        break;
      case "up":
        tail.y -= 1 ;
        break;
    }

    sections.push(tail);
  }


  return {
    init: init,
    getSize: getSize,
    getSections: getSections,
    move: move,
    setDirection: setDirection,
    isEatingOwnTail: isEatingOwnTail,
    isEatingFood: isEatingFood
  }
} (window));
