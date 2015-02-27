class Hash
  def pick(*keys)
    Hash.new.tap do |hash|
      keys.each do |key|
        hash[key] = self[key]
      end
    end
  end

  def pick!(*keys)
    to_delete = self.except(keys)

    to_delete.each do |key|
      self.delete(key)
    end
  end


  def except(*keys)
    Hash.new.tap do |hash|
      self.each do |key, value|
        unless keys.include? key then hash[key] = value end
      end
    end
  end

  def compact_values
    Hash.new.tap do |hash|
      self.each do |key, value|
        hash[key] = value if value
      end
    end
  end

  def defaults(hash)
    Hash.new.tap do |h|
      self.each do |key, value|
        h[key] = value
      end
      
      hash.each do |key, value|
          h[key] = value if !self.include? key
      end
    end
  end

end
