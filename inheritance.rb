require_relative 'helpers'

header('Inheritance')

class Vehicle
  @@class_var = 2
  @instance_var = 2

  def self.class_var
    @@class_var
  end

  def self.instance_var
    @instance_var
  end
end

class Car < Vehicle
  @@class_var = 3
  @instance_var = 3
end

class Truck < Vehicle
  @@class_var = 4
  @instance_var = 4
end

headline('Class variables')

puts Vehicle.class_var            #4
puts Car.class_var                #4
puts Truck.class_var              #4

headline('Instance variables')

puts Vehicle.instance_var            #2
puts Car.instance_var                #3
puts Truck.instance_var              #4
