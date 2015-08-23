require_relative 'board'

module GameOfLife
  class << GameOfLife
    def start
      start_positions = [ [0, 0], [0, 1], [1, 0], [1, 1], [10, 10],
                          [10, 11], [10, 12]]
      
      board = GameOfLife::Board.new(20, 20, start_positions) 

      puts "Initial state"
      puts board.to_s
      
      sleep 5

      game_loop(board)
    end

    def game_loop(board)
      iteration = 1

      loop do
        system "clear" or system "cls"

        puts "Iteration: #{iteration}"

        board.next_generation
        puts board.to_s
        
        iteration += 1
        sleep 1 
      end
    end
  end
end

GameOfLife.start
