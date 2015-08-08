class Vector
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # The unit vector (1, 0).
  def self.e
    Vector.new(1, 0)
  end

  # The unit vector (0, 1).
  def self.j
    Vector.new(0, 1)
  end

  def length
    return @x ** 2 + @y ** 2
  end

  def magnitude
    Math.sqrt(length)
  end

  def normalize
    m = magnitude

    Vector.new(@x / m, @y / m)
  end

  def ==(other)
    return @x == other.x && @y == other.y
  end

  def +(other)
    Vector.new(@x + other.x, @y + other.y)
  end

  def -(other)
    Vector.new(@x - other.x, @y - other.y)
  end

  def *(scalar)
    Vector.new(@x * scalar, @y * scalar)
  end

  def /(scalar)
    Vector.new(@x / scalar, @y / scalar)
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def inspect
    to_s
  end
end
