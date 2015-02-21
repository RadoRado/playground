class Array
  # Your code goes here.
  def to_hash
    Hash.new.tap do |hash|
      self.each do | key_value |
        key = key_value[0]
        value = key_value[1]
        hash[key] = value
      end
    end
  end

  def index_by
    Hash.new.tap do |hash|
      self.each do |item|
        key = yield item
        hash[key] = item
      end
    end
  end

  def subarray_count(search)
    count = 0
    items = Array.new(self)

    while items.length > 0 do
      
      if items.take(search.length) == search then
        count += 1
      end
      
      items = items.drop(1)
    end
    count
  end

  def occurences_count
    Hash.new(0).tap do |hash|
      self.each do |value|
        hash[value] += 1
        puts(items)
      end
    end
  end
end
