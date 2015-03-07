class Person
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    ["Hi there!", "My name is #{@name}"].join "\n"
  end

  def backwards
    @name.reverse
  end

  def talk
    p greeting
    p backwards
  end

end
