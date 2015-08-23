require_relative 'board'

module GameOfLife
  class << GameOfLife
    def start
      b = GameOfLife::Board.new(20, 20, start_positions = [ [0, 0], [0, 1], [1, 0], [1, 1] ])
      iteration = 0

      loop do
        system "clear" or system "cls"

        puts "Iteration: #{iteration}"

        b.next_generation
        puts b.to_s
        
        iteration += 1
        sleep 2
      end
    end
  end
end

GameOfLife.start
