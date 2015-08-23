module GameOfLife
  class Cell
    attr_accessor :is_alive, :x, :y
    
    def initialize(x, y)
      @x = x
      @y = y
      is_alive = false
    end

    def to_s
      if is_alive
        return "*"
      end

      "-"
    end
  end
end
