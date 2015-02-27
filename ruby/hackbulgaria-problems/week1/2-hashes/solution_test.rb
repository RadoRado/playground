require 'minitest/autorun'

require_relative 'solution'

class HashTest < Minitest::Test
  def test_pick
    assert_equal ({a: 1, b: 2, c: 3}.pick(:a, :b)), {:a =>1, :b => 2}
  end

  def test_pick2
    assert_equal ({"a"=> 1, "b"=>  2}.pick("a", "b")), {"a"=> 1, "b"=> 2}
  end

  def test_except
    assert_equal ({a: 1, b: 2, d: nil}.except(:d)), {:a => 1, :b => 2}
  end

  def test_compact_values
    assert_equal ({a: 1, b: 2, c: false, d: nil}.compact_values), {:a=>1, :b=>2}
  end

  def test_defaults
    assert_equal ({a: 1, b: 2}.defaults(a: 4, c: 3)), {:a=>1, :b=>2, :c=>3}
  end

  def test_pick!
    h = { a: 1, b: 2, c: 3}
    h.pick!(:a, :b)

    assert_equal h, {:a => 1, :b => 2}
  end

end
