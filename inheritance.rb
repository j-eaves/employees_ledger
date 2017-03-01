#Example of Inheritance
class Vehicle
  def initialize
    @speed = 0
    @direction = 'north'
  end
  def brake
    @speed = 0
  end
  def accelerate
    @speed += 10
  end
  def turn(new_direction)
    @direction = new_direction
  end
end

class Car < Vehicle
  attr_reader :fuel, :make, :model #This is all of the return methods
  #attr_writer :active
  def initialize(input_data)#This input_data is a hash ex: input_data{}
    @fuel = input_data[:fuel]
    @make = input_data[:make]
    @model = input_data[:model]
  end
  def honk_horn
    puts "Beeeeeeep!"
  end
end

class Bike < Vehicle
  attr_reader :speed, :type, :weight #This is all of the return methods
  attr_writer :active
  def initialize(input_options) #input_options is the hash from when we initialize a new instance of this class
    # @input_options = input_options
    @speed = input_options[:speed]
    @type = input_options[:type]
    @weight = input_options[:weight]
  end
  def ring_bell
    puts "Ring ring!"
  end
  # def type
  #   return @type
  # end
end
car1 = Car.new(fuel: "gasoline", make: "Ford", model: "F-150")#This is a hash that you are putting into the class
bike1 = Bike.new(speed: 25, type: "Schwinn", weight: 35)#This is a hash that you are putting into the class
p bike1.type
p car1.make
car1.honk_horn
bike1.ring_bell