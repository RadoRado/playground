require 'minitest/autorun'
require_relative '2d_vector'

class VectorTest < Minitest::Test
  def test_vector_initialization
    v = Vector.new 1, 2
    assert_equal 1, v.x
    assert_equal 2, v.y
  end

  def test_e_unit_vector
    unit_vector = Vector.e 
    assert_equal 1, unit_vector.x
    assert_equal 0, unit_vector.y
  end

  def test_j_unit_vector
    unit_vector = Vector.j 
    assert_equal 0, unit_vector.x
    assert_equal 1, unit_vector.y
  end

  def test_vector_magnitude
    v = Vector.new(1, 1)

    assert_in_delta 1.4142135623730951, v.magnitude, 1e-9
  end

  def test_vector_normalization
    v = Vector.new(1, 2)
    n = v.normalize

    assert_in_delta 0.4472135954999579, n.x, 1e-9
    assert_in_delta 0.8944271909999159, n.y, 1e-9
  end

  def test_two_equal_vectors
    v1 = Vector.new(1, 2)
    v2 = Vector.new(1, 2)

    assert v1 == v2
  end

  def test_two_non_equal_vectors
    v1 = Vector.new(1, 2)
    v2 = Vector.new(1, 3)

    assert v1 != v2
  end
  
  def test_vector_addition
    v1 = Vector.e
    v2 = Vector.j
    v3 = v1 + v2

    assert_equal 1, v3.x
    assert_equal 1, v3.y
  end

  def test_vector_substraction
    v1 = Vector.e
    v2 = Vector.j
    v3 = v1 - v2

    assert_equal 1, v3.x
    assert_equal -1, v3.y
  end
  
  def test_vector_scalar_multiplication
    v1 = Vector.new(2, 2)
    v2 = v1 * 2

    assert_equal 4, v2.x
    assert_equal 4, v2.y

  end

  def test_vector_scalar_division
    v1 = Vector.new(2, 2)
    v2 = v1 / 2

    assert_equal 1, v2.x
    assert_equal 1, v2.y
  end

  def test_vector_to_s
    v = Vector.new(1, 2)

    assert_equal "(1, 2)", v.to_s
  end

end
