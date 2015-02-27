require 'minitest/autorun'

require_relative 'solution'

class SeriesTest < Minitest::Test
  
  def test_fib_series_for_1
    assert_equal series('fibonacci', 1), 1
  end

  def test_fib_series_for_29
    assert_equal series('fibonacci', 29), 6765
  end

  def test_lucas_series_for_1
    assert_equal series('lucas', 1), 2
  end

  def test_summed_series
    assert_equal series('summed', 1), 3
  end


end
