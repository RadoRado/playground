module GameOfLife
  class Cell
    attr_accessor :is_alive, :x, :y
    
    def initialize(x, y)
      @x = x
      @y = y
      @is_alive = false
    end
    
    def die
      if @is_alive
        p "#{@x}:#{@y} dies"
        @is_alive = false
      end
    end

    def bring_to_life
      @is_alive = true
    end

    def to_s
      if @is_alive
        return "*"
      end

      "-"
    end
  end
end
