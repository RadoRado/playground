def format_string(string, width)
  string
    .strip
    .gsub(/\s+/, " ")
    .upcase
    .center(width)
end

def render_tic_tac_toe_board_to_ascii(board)
  board
    .each_slice(3)
    .map do |slice|
      slice.map do |item|
        item.to_s.center(3)
      end
      .unshift("")
      .<<("")
      .join "|"
    end
    .join "\n"

end
