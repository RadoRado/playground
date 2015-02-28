require 'minitest/autorun'

require_relative 'solution'

class SeriesTest < Minitest::Test
 
  def test_1st_fib
    assert_equal 1, calculate_sequence(1, 1, 1)
  end

  def test_5th_fib
    assert_equal 5, calculate_sequence(1, 1, 5)
  end

  def test_12th_fib
    assert_equal 144, calculate_sequence(1, 1, 12)
  end

  def test_fib_series_for_1
    assert_equal series('fibonacci', 1), 1
  end

  def test_fib_series_for_20
    assert_equal series('fibonacci', 20), 6765
  end

  def test_lucas_series_for_1
    assert_equal series('lucas', 1), 2
  end

  def test_summed_series
    assert_equal series('summed', 1), 3
  end


end
