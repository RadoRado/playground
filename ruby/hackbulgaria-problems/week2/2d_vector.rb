class Vector2D
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # The unit vector (1, 0).
  def self.e
    Vector2D.new(1, 0)
  end

  # The unit vector (0, 1).
  def self.j
    Vector2D.new(0, 1)
  end

  def length
    return Math.sqrt(@x ** 2 + @y ** 2)
  end

  alias_method :magnitude, :length 

  def normalize
    m = magnitude

    Vector2D.new(@x / m, @y / m)
  end

  def ==(other)
    return @x == other.x && @y == other.y
  end

  def +(other)
    Vector2D.new(@x + other.x, @y + other.y)
  end

  def -(other)
    Vector2D.new(@x - other.x, @y - other.y)
  end

  def *(scalar)
    Vector2D.new(@x * scalar, @y * scalar)
  end

  def /(scalar)
    Vector2D.new(@x / scalar, @y / scalar)
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def inspect
    to_s
  end
end
