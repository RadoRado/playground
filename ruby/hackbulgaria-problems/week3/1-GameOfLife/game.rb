# rubocop:disable Style/Documentation

require_relative 'board.rb'
require_relative 'figure.rb'

module GameOfLife
  class << GameOfLife
    def start
      start_figures = [GameOfLife::Spaceships::Glider.new,
                       GameOfLife::Oscillators::Blinker.new(10, 10)]

      board = GameOfLife::Board.new(20, 20, start_figures)

      puts 'Initial state'
      puts board.to_s

      sleep 5

      game_loop(board)
    end

    def game_loop(board)
      iteration = 1

      loop do
        system 'clear'

        puts "Iteration: #{iteration}"

        board.next_generation
        puts board.to_s

        iteration += 1
        sleep 0.5
      end
    end
  end
end

GameOfLife.start
