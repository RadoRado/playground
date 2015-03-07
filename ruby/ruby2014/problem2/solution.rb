module  FilterCombinator
  def &(other_filter)
    
    Filter.new do |number|
      self.test(number) && other_filter.test(number)
    end
    
  end

  def |(other_filter)
    Filter.new do |number|
      self.test(number) || other_filter.test(number)    
    end
  end
end

class Filter

  include FilterCombinator

  def initialize(&block)
    @block = block
  end

  def test(value)
    @block.call value
  end

end

class TypeFilter

  include FilterCombinator

  def initialize(type)
    @types = {
      integer: Integer,
      real: Float,
      complex: Complex
    }
    @type = type
  end

  def test(value)
    begin
      value.is_a?(@types[@type])
    rescue TypeError
      false
    end
  end
end

class SignFilter
  
  include FilterCombinator

  def initialize(type)
    @type = type
  end

  def test(value)
    case @type
    when :positive then value > 0
    when :non_positive then value <= 0
    when :negative then value < 0
    else false
    end
  end
end

class NumberSet
  
  include Enumerable
 
  def initialize
    @container = {}
  end
  
  def size
    @container.length
  end

  def empty?
    size == 0
  end

  def <<(value)
    unless container_has_value(value)
      @container[value.to_c] = value
    end
  end

  def [](filter)
    NumberSet.new.tap do |set|
       @container
        .each_value
        .to_a
        .select { |value| filter.test(value) }
        .each { |value| set << value }
    end
  end
  
  def each
    @container.each_value { |value| yield value }
  end

  private

  def container_has_value(value)
    @container.any? do |key, _|
      key == value.to_c
    end
  end

end
