module GameOfLife
  class Board
    def initialize(width, height, start_positions=[])
      @board = []

      1.upto(width) do |current_row| 
        row = ["-"] * height
        @board << row 
      end
      

      start_positions.each do |position|
        x, y = position
        @board[x][y] = "*"
      end
      
    end

    def to_s
      @board.map do |row|
        row.join(" ")
      end
      .join "\n"
    end
  end
end
