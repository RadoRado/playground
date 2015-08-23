module GameOfLife
  class Cell
    attr_accessor :is_alive
    
    def initialize
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
