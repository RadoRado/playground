require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  class Collection
    include MyEnumerable

    def initialize(*data)
      @data = data
    end

    def each(&block)
      @data.each(&block)
    end

    def ==(otherCollection)
      @data == otherCollection.data
    end

    def get(index)
      return @data[index]
    end
  end

  def test_map
    collection = Collection.new(*1..5)

    assert_equal [2, 3, 4, 5, 6], collection.map(&:succ)
  end

  def test_filter
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.filter(&:odd?)
  end

  def test_reject
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.reject(&:even?)
  end

  def test_reduce
    collection = Collection.new(*1..10)

    assert_equal 55, collection.reduce(0) { |sum, n| sum + n }
  end

  def test_include?
    collection = Collection.new(*1..10)

    assert_equal true, collection.include?(5)
  end


  def test_any?
    collection = Collection.new(*1..10)

    assert collection.any?(&:even?)
  end

  def test_all?
    collection = Collection.new(*1..10)

    assert collection.all? { |x| x > 0 }
  end
  

  def test_size
    collection = Collection.new(*1..10)

    assert_equal 10, collection.size
  end

  def test_count_with_element_nil
    collection = Collection.new(*1..10)

    assert_equal 10, collection.count
  end

  def test_count_with_non_nil_element
    collection = Collection.new(*1..10)

    assert_equal 1, collection.count(10)
  end
  
end
