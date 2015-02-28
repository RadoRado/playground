def calculate_sequence(first, second, n)
  while n > 1
    next_member = first + second
    
    first = second
    second = next_member

    n = n - 1
  end

  first
end

def series(name, member)
  case name
  when 'fibonacci' then calculate_sequence(1, 1, member)
  when 'lucas' then calculate_sequence(2, 1, member)
  when 'summed' then calculate_sequence(1, 1, member) + calculate_sequence(2, 1, member)
  end
end
