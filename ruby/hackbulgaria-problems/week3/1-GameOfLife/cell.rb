# rubocop:disable Style/Documentation

module GameOfLife
  class Cell
    attr_accessor :is_alive, :x, :y

    def initialize(x, y, is_alive = false)
      @x = x
      @y = y
      @is_alive = is_alive
    end

    def die
      @is_alive = false
    end

    def bring_to_life
      @is_alive = true
    end

    def to_s
      return '-' unless @is_alive

      '*'
    end
  end
end
