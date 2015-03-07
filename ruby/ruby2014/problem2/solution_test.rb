require 'minitest/autorun'

require_relative 'solution'

class NumberSetTest < Minitest::Test
 
  def test_number_set_should_be_empty
    set = NumberSet.new
    
    assert_equal 0, set.size
    assert set.empty?
  end


  def test_number_set_adds_single_value
    set = NumberSet.new

    set << 6

    assert_equal 1, set.size
  end


  def test_number_set_adds_two_same_values_from_same_type
    set = NumberSet.new

    set << 6
    set << 6

    assert_equal 1, set.size
  end

  def test_number_set_adds_two_same_values_from_different_type
    set = NumberSet.new

    set << Rational(22, 2)
    set << 11
    set << 11.0

    assert_equal 1, set.size
  end

  def test_number_set_adds_two_same_values_from_different_type2
    set = NumberSet.new

    set << 2.5
    set << 2.5+0i
    set << 11.0

    assert_equal 2, set.size
  end

  def test_filter_with_block_with_given_value
    even_filter = Filter.new { |number| number.even? }
    
    assert even_filter.test(2)
    assert !even_filter.test(3) 
  end

  def test_type_filter_with_integer
    integer_filter = TypeFilter.new(:integer)

    assert integer_filter.test(2)
    assert !integer_filter.test(2.0)
  end

  def test_type_filter_with_real
    real_filter = TypeFilter.new(:real)

    assert real_filter.test(2.0)
    assert !real_filter.test(2)
  end

  def test_type_filter_with_complex
    complex_filter = TypeFilter.new(:complex)

    assert complex_filter.test(2+0i)
    assert !complex_filter.test(2)
  end

  def test_type_filter_with_unknown_type
    unknown_filter = TypeFilter.new(:unknown)

    assert !unknown_filter.test(2)
  end

  def test_positive_sign_filter
    positive = SignFilter.new(:positive)
    
    assert positive.test(2)
    assert positive.test(2.0)
    assert positive.test(Rational(22, 11))
    assert !positive.test(0)
    assert !positive.test(-2)
  end

  def test_non_positive_sign_filter
    non_positive = SignFilter.new(:non_positive)
    
    assert non_positive.test(0)
    assert non_positive.test(-2)
    assert non_positive.test(Rational(-22, 11))
    assert !non_positive.test(2)
  end

  def test_negative_sign_filter
    negative = SignFilter.new(:negative)
    
    assert !negative.test(2)
    assert !negative.test(2.0)
    assert !negative.test(Rational(22, 11))
    assert !negative.test(0)
    assert negative.test(-2)
  end

  def test_filter_evens_from_number_set
    evens = Filter.new { |number| number.even? }
    set = NumberSet.new

    set << 1
    set << 2
    set << 3
    set << 4
    
    set = set[evens]
    
    assert_equal 2, set.size
  end

  def test_filter_complex_from_set
    complex = TypeFilter.new(:complex)
    set = NumberSet.new

    set << 1+0i
    set << 2+2i
    set << 3
    set << 4
    
    set = set[complex]
    
    assert_equal 2, set.size
  end

  def test_filter_negative_from_set
    negative = SignFilter.new(:negative)
    set = NumberSet.new
    
    set << 0
    set << 1
    set << 2
    set << 3
    set << 4
    set << -10
    
    set = set[negative]
    
    assert_equal 1, set.size
  end

  def test_filter_combination_with_and
    set = NumberSet.new

    set << -10
    set << 2
    set << 5

    filter = SignFilter.new(:positive) & Filter.new { |number| number.even? }
    
    set = set[filter]

    assert_equal 1, set.size
  end


  def test_filter_combination_with_or
    set = NumberSet.new
    
    set << 1+0i
    set << 2.0
    set << -10
     
    filter = TypeFilter.new(:integer) | TypeFilter.new(:complex)
    
    set = set[filter]

    assert_equal 2, set.size
  end


  def test_numberset_is_enumerable
    set = NumberSet.new

    [1,2,3,4].each { |number| set << number }

    sum = set.inject { |acc, x| acc += x }
    
    assert_equal 10, sum
  end

end
