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
    
    def add_cell(x, y, is_alive=true)
      @coordinates << GameOfLife::Cell.new(x + @dx, y + @dy, is_alive)
    end
  end
  
end

module GameOfLife
  module StillLifes
    class Box < GameOfLife::Figure
      def initialize(dx = 0, dy = 0)
        super
        add_cell(0, 0)
        add_cell(0, 1)
        add_cell(1, 0)
        add_cell(1, 1)
      end
    end

    class Beehive < Figure
      def initialize(dx = 0, dy = 0)
        super
        
        add_cell(0, 0, false)
        add_cell(0, 1)
        add_cell(0, 2)
        add_cell(0, 3, false)
        
        add_cell(1, 0)
        add_cell(1, 1, false)
        add_cell(1, 2, false)
        add_cell(1, 3)
        
        add_cell(2, 0, false)
        add_cell(2, 1)
        add_cell(2, 2)
        add_cell(2, 3, false)
      end
    end
  end
end

module GameOfLife
  module Oscillators
    class Blinker < Figure
      def initialize(dx = 0, dy = 0)
        super

        add_cell(0, 0)
        add_cell(0, 1)
        add_cell(0, 2)
      end
    end
  end
end

module GameOfLife
  module Spaceships
    class Glider < Figure
      def initialize(dx = 0, dy = 0)
        super

        add_cell(0, 0, false)
        add_cell(0, 1)
        add_cell(0, 2, false)

        add_cell(1, 0, false)
        add_cell(1, 1, false)
        add_cell(1, 2)

        add_cell(2, 0)
        add_cell(2, 1)
        add_cell(2, 2)
      end
    end
  end

end
