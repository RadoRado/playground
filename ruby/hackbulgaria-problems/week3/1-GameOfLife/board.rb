require_relative 'cell.rb'

module GameOfLife
  class Board
    def initialize(width, height, start_positions=[])
      @board = []

      1.upto(width) do |current_row| 
        row = [0] * height
        row = row.map { |_| GameOfLife::Cell.new }
        @board << row 
      end
      

      start_positions.each do |position|
        x, y = position
        @board[x][y].is_alive = true
      end
      
    end
    
    def next_generation
      
    end

    def to_s
      @board.map do |row|
        row.map { |cell| cell.to_s }.join(" ")
      end
      .join "\n"
    end
  end
end
