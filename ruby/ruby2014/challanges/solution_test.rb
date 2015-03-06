require 'minitest/autorun'

require_relative 'solution'

class SeriesTest < Minitest::Test
 
  def test_format_string_with_larger_than_text_width
    expected = "  RUN FOREST RUN!!  "
    assert_equal expected, format_string("run  FOrest   run!!", 20)
  end
  
  def test_format_string_no_padding
    expected = "DO YOUR HOMEWORK NOW"
    assert_equal expected, format_string("  do YouR   homeWork   NoW    ", 10)
  end

  def test_format_bacon_odd_width
    expected = "BACON "
    assert_equal expected, format_string("bacon", 6) 
  end


  def test_render_tic_tac_toe_board_to_ascii
    tic_tac_toe_board = [
      nil, nil, :x,
      :o,  nil, :x,
      :o,  :x,  :o,
    ]

  expected = ["|   |   | x |",
              "| o |   | x |",
              "| o | x | o |"].join "\n"
  
  assert_equal expected, render_tic_tac_toe_board_to_ascii(tic_tac_toe_board)
  end

end
