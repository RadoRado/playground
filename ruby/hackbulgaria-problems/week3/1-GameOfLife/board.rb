require_relative 'cell.rb'

module GameOfLife
  class Board
    
    MOVEMENTS = [[-1, -1], [0, -1], [1, -1],
                 [-1, 0], [1, 0],
                 [-1, 1], [0, 1], [1, 1]]
    
    attr_reader :width, :height

    def initialize(width, height, start_positions=[])
      @width = width
      @height = height
      @board = allocate_board

      start_positions.each do |position|
        x, y = position
        @board[x][y].bring_to_life
      end
      
    end
    
    def next_generation
      new_board = allocate_board
      cells = @board.flatten

      cells.each do |cell|
        neighbours_status = neighbours(cell)
        
        alive_neighbours = neighbours_status["alive"]

        if cell.is_alive
          if alive_neighbours < 2  || alive_neighbours > 3 
            new_board[cell.x][cell.y].die
          end

          if [2, 3].include? alive_neighbours 
            new_board[cell.x][cell.y].bring_to_life
          end 
        end
        if !cell.is_alive
          if alive_neighbours == 3
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
    
    def allocate_board
      Array.new.tap do |board|
        0.upto(@width) do |current_row| 
          row = [0] * @height
          board << row.each_with_index.map do |_, index|
            GameOfLife::Cell.new(current_row, index)
          end
        end
      end
    end

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
