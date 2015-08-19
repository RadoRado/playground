require_relative 'board'

module GameOfLife
  class Game
    def self.start
      b = GameOfLife::Board.new(20, 20, start_positions = [ [0, 1] ])
      iteration = 0

      loop {
        system "clear" or system "cls"

        puts "Iteration: #{iteration}"
        puts b.to_s
        
        iteration += 1
        sleep 2
      }
    end
  end
end


GameOfLife::Game.start
