require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase

  def test_histogram_basic
    assert_equal histogram("abraca"), {"a"=>3, "b"=>1, "r"=>1, "c"=>1 }
  end

  def test_histogram_empty
    assert_equal histogram(""), {}
  end

  def test_prime
    assert prime? 7
  end

  def test_palindrom_int
    assert palindrome? 77
  end

  def test_palindrom_string
    assert palindrome? "kapak"
  end

  def test_palindrom_string_upcase
    assert palindrome? "Race car"
  end

  def test_not_palindrom_string
    assert !palindrome?("kapaka")
  end

  def test_palindrom_list
    assert palindrome? [1,2,1]
  end
  
  def test_anagram_words
    assert anagram?("ruby", "ubyr")
  end

  def test_non_anagram_words
    assert !anagram?("kapak", "boza")
  end

  def test_anagram_empty_strings
    assert anagram?("", "")
  end

  def test_remove_prefix
    assert_equal "Nights Out", remove_prefix("Ladies", "Ladies Nights Out")   
  end

  def test_remove_prefix
    assert_equal "baba baba", remove_prefix("baba", "baba baba baba")
  end

  def test_digits
    assert_equal [1, 2, 3], digits(123)
  end

  def test_count
    expected = { 1 => 3, 2 => 3 }
    assert_equal expected, count([1, 1, 1, 2, 2, 2])
  end

  def test_count_with_words
    expected = {"this"=>1, "is"=>1, "an"=>1, "array"=>1, "of"=>1, "words"=>3}
    assert_equal expected, count(%w(this is an array of words words words))
  end

  def test_count_words_one_sentence
    expected = {"this"=>1, "is"=>1, "a"=>1, "sentence"=>1}
    assert_equal expected, count_words("this is a sentence.")
  end

end

