def log(level)
  if level > 0
    message = yield
    puts message
  end
end

def sum(items)
  items.inject { |sum, x|
    sum + x
  }
end

def yield_sum
  a = yield

  sum a
end

def say_hello(name)
 name = yield name
 puts "Hello #{name}"
end
