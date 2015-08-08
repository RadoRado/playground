module MyEnumerable
  def map
    result = []
    
    each do |element|
      result << (yield element)
    end

    result
  end

  def filter
    result = []

    each do |element|
      result << element if yield element
    end
    
    result
  end

  def reject
    result = []

    each do |element|
      result << element unless yield element
    end
    
    result
  end

  def reduce(initial = nil)
    result = initial

    each do |element|
      result = yield result, element
    end

    result
  end

  def any?
    filter { |element| yield element }.length > 0
  end

  def all?
    filter { |element| yield element}.length == filter { |_| true }.length
  end
  
  def include?(element)
    reduce(false) do |found, value|
      found || value == element
    end
  end

  def count(element = nil)
    filter do |x|
      if element.nil? then x
      else x == element
      end
    end.length
  end

  def size
    map { |_| 1}
      .reduce(&:+)
  end
end
