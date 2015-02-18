def histogram(string)
    result = {}

    string.each_char { |c|
        if result[c] 
            result[c] = result[c] + 1
        else
            result[c] = 1
        end
    }

    result
end

def prime?(n)
    prime = true
    
    2.upto(n-1) do |try|
        if n % try == 0
            prime = false
        end
    end

    prime
end

def palindrome?(object)
  if object.kind_of?(Array) {
    return object.reverse == object
  }
  end
  
  str_object = object.to_s.downcase.split(/\W+/).join
  str_object.reverse == str_object

end

def anagram?(word, other)
  word.split("").sort == other.split("").sort
end

def remove_prefix(prefix, string)
  words = string.split(/\W+/)

  if words[0] == prefix
    words.shift
  end

  words.join(" ")
end

def digits(n)
  n.to_s.split("").map do |x|
      x.to_i
  end
end

def fizzbuzz(range)
  range.map do |n|
    case
    when [n % 3, n % 5].all?(&:zero?) then :fizzbuzz
    when (n % 3).zero? then :fizz
    when (n % 5).zero? then :buzz
    else            n
    end
  end
end
