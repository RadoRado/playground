require_relative 'cell.rb'

module GameOfLife
  class Board
    
    MOVEMENTS = [ [-1, -1], [0, -1], [1, -1],
                  [-1, 0], [1, 0],
                  [-1, 1], [0, 1], [1, 1] ]
    
    attr_reader :width, :height

    def initialize(width, height, start_positions=[])
      @board = []
      @width = width
      @height = height

      1.upto(width) do |current_row| 
        row = [0] * height
        @board << row.each_with_index.map do |_, index|
          GameOfLife::Cell.new(current_row - 1, index)
        end

      end
      
      start_positions.each do |position|
        x, y = position
        @board[x][y].is_alive = true
      end
      
    end
    
    def next_generation
      cells = @board.flatten

      cells.each do |cell|
        p neighbours(cell)
      end
    end

    def to_s
      @board.map do |row|
        row.map(&:to_s).join(" ")
      end
      .join "\n"
    end

    private
    
    def in_board(x, y)
      x >= 0 and x < @width and y >= 0 and y < @height
    end
    def neighbours(cell)
      Hash.new.tap do |h|
        h["alive"] = 0
        h["dead"] = 0

        GameOfLife::Board::MOVEMENTS.each do |movement|
          dx, dy = movement
          neighbour_x, neighbour_y = [cell.x + dx, cell.y + dy]

          if in_board(neighbour_x, neighbour_y) && @board[cell.x + dx][cell.y + dy].is_alive then h["alive"] += 1
          else h["dead"] += 1
          end
        end
      end
    end
  end
end
