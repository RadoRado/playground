# rubocop:disable Style/Documentation
require_relative 'cell.rb'

module GameOfLife
  class Figure
    attr_accessor :coordinates
    attr_accessor :dx, :dy

    def initialize(dx = 0, dy = 0)
      @dx = dx
      @dy = dy
      @coordinates = []
    end

    def render_to(board)
      @coordinates.each do |cell|
        board[cell.x][cell.y] = cell
      end
    end

    def add_cell(x, y, is_alive = true)
      @coordinates << GameOfLife::Cell.new(x + @dx, y + @dy, is_alive)
    end

    def create(figure_structure)
      figure_structure.each do |coords|
        x, y, alive = coords
        add_cell(x, y, alive)
      end
    end
  end
end

module GameOfLife
  module StillLifes
    class Box < GameOfLife::Figure
      def initialize(dx = 0, dy = 0)
        super

        create([[0, 0, true], [0, 1, true], [1, 0, true], [1, 1, true]])
      end
    end

    class Beehive < Figure
      def initialize(dx = 0, dy = 0)
        super

        # create 1st row
        create([[0, 0, false], [0, 1, true], [0, 2, true], [0, 3, false]])

        # create 2nd row
        create([[1, 0, true], [1, 1, false], [1, 2, false], [1, 3, true]])

        # create 3rd row
        create([[2, 0, false], [2, 1, true], [2, 2, true], [2, 3, false]])
      end
    end
  end
end

module GameOfLife
  module Oscillators
    class Blinker < Figure
      def initialize(dx = 0, dy = 0)
        super

        create([[0, 0, true], [0, 1, true], [0, 2, true]])
      end
    end
  end
end

module GameOfLife
  module Spaceships
    class Glider < Figure
      def initialize(dx = 0, dy = 0)
        super

        # Create 1st row
        create([[0, 0, false], [0, 1, true], [0, 2, false]])

        # Create 2nd row
        create([[1, 0, false], [1, 1, false], [1, 2, true]])

        # Create 3rd row
        create([[2, 0, true], [2, 1, true], [2, 2, true]])
      end
    end
  end
end
