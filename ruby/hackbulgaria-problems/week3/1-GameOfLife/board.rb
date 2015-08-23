require_relative 'cell.rb'

module GameOfLife
  class Board
    
    MOVEMENTS = [[-1, -1], [0, -1], [1, -1],
                 [-1, 0], [1, 0],
                 [-1, 1], [0, 1], [1, 1]]
    
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
        @board[x][y].bring_to_life
      end
      
    end
    
    def next_generation
      new_board = []
      
      @board.each_with_index do |_, row_index|
        new_board[row_index] = []
        @board[row_index].each_with_index do |_, col_index|
          new_board[row_index][col_index] = GameOfLife::Cell.new(row_index, col_index)
        end
      end

      cells = @board.flatten

      cells.each do |cell|
        neighbours_status = neighbours(cell)
        
        if cell.is_alive
          if neighbours_status["alive"] < 2  || neighbours_status["alive"] > 3 
            new_board[cell.x][cell.y].die
          end

          if [2, 3].include? neighbours_status["alive"]
            new_board[cell.x][cell.y].bring_to_life
          end 
        end
        if !cell.is_alive
          if neighbours_status["alive"] == 3
            new_board[cell.x][cell.y].bring_to_life
          end
        end

      end
      @board = new_board
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
