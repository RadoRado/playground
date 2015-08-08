class Vector
  attr_reader :components

  def initialize(*components)
    @components = components
  end

  def dimension
    @components.length
  end

  def length
    Math.sqrt(@components.map { |x| x ** 2 }.reduce(&:+))
  end

  alias_method :magnitude, :length

  def normalize
    m = length
    return Vector.new(@components.map { |x| x / m })
  end

  def [](index)
    @components[index]
  end

  def []=(index, value)
    @components[index] = value
  end

  def ==(other)
    @components == other.components
  end

  def +(other)
    Vector.new(@components.map.with_index do |x, index|
      x + other[index]
    end)
  end

  def -(other)
    Vector.new(@components.map.with_index do |x, index|
      x - other[index]
    end)
  end

  def *(scalar)
    Vector.new(@components.map { |x| x * scalar })
  end

  def /(scalar)
    Vector.new(@components.map { |x| x / scalar })
  end

  def to_s
    @components.join(", ")
  end

  def inspect
    to_s
  end
end

