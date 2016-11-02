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
# class variables are overwritten by child classes
puts Vehicle.class_var            # 4
puts Car.class_var                # 4
puts Truck.class_var              # 4

headline('Instance variables')
# instance variables keep the right values defined by every class type
puts Vehicle.instance_var            # 2
puts Car.instance_var                # 3
puts Truck.instance_var              # 4

p Truck.ancestors                                   # [Truck, Vehicle, Object, Kernel, BasicObject]
p Truck.superclass                                  # Vehicle
p Truck.superclass.superclass                       # Object
p Truck.superclass.superclass.superclass            # BasicObject
p Truck.superclass.superclass.superclass.superclass # nil

p String.ancestors                                  # [String, Comparable, Object, Kernel, BasicObject]
p String.superclass                                 # Object
p String.superclass.superclass                      # BasicObject
p String.superclass.superclass.superclass           # nil


p Array.ancestors                                  # [Array, Enumerable, Object, Kernel, BasicObject]
p Array.superclass                                 # Object
p Array.superclass.superclass                      # BasicObject
p Array.superclass.superclass.superclass           # nil
