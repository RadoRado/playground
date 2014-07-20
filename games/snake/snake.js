window.Snake =
(function(window, undefined) {
  "use strict";
  var
    allowedDirections = {
      "left": ["up", "down"],
      "right": ["up", "down"],
      "up": ["left", "right"],
      "down": ["left", "right"]
    };

  function Snake(size, sectionsForStart, color, yForStart) {
    var
      sections = [],
      direction = "left";

    this.getSize = function() {
      return size;
    };

    this.getSections = function() {
      return sections.slice();
    };

    this.getColor = function() {
      return color;
    };

    this.setDirection = function(newDirection) {
      if(allowedDirections[direction].indexOf(newDirection) !== -1) {
        direction = newDirection;
        return true;
      }

      return false;
    };

    this.move = function() {
      // we take the tail, make it with head coordinates
      // then update it and put it as the new head
      var tail = sections.shift();

      tail.x = sections[sections.length - 1].x;
      tail.y = sections[sections.length - 1].y;

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
    };

    var startSection = 0;

    while(startSection <= sectionsForStart) {
      sections.push({
        x: startSection,
        y: yForStart || 0
      });

      startSection += 1;
    }
  }

  Snake.prototype.isEatingOwnTail = function() {
    var
      sections = this.getSections(),
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
  };

  Snake.prototype.isEatingFood = function(foodPoint) {
    var
      sections = this.getSections(),
      headIndex = sections.length - 1,
      head = sections[headIndex];

    if(head.x === foodPoint.x && head.y === foodPoint.y) {
      sections.unshift(foodPoint);
      this.move();
      return true;
    }

    return false;
  };

  return Snake;
} (window));
