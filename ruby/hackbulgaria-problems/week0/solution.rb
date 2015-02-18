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
    
    2.upto(n-1) { |try|
        if n % try == 0
            prime = false
        end
    }

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
