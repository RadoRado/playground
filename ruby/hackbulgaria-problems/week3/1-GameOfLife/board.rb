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

      @board.flatten.each do |cell|
        next_generation_for_cell(cell, @board, new_board)        
      end

      @board = new_board
    end

    def next_generation_for_cell(old_cell, old_board, new_board)
      alive_count = alive_neighbours old_cell, old_board

      if old_cell.is_alive
        if alive_count < 2 || alive_count > 2 
          new_board[old_cell.x][old_cell.y].die
        end

        if [2, 3].include? alive_count 
          new_board[old_cell.x][old_cell.y].bring_to_life
        end 
      end

      if !old_cell.is_alive
        if alive_count == 3
          new_board[old_cell.x][old_cell.y].bring_to_life
        end
      end

      new_board
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

    def alive_neighbours(cell, board)
      alive_count = 0

      GameOfLife::Board::MOVEMENTS.each do |movement|
        dx, dy = movement
        neighbour_x, neighbour_y = [cell.x + dx, cell.y + dy]

        if in_board(neighbour_x, neighbour_y) && board[cell.x + dx][cell.y + dy].is_alive
          alive_count += 1
        end

      end

      alive_count
    end
  end
end
