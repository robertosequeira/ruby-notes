require_relative 'helpers'

header('Classes')

class Spaceship

  def initialize
    @creation_date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

  def launch(destination)
    @destination = destination
  end

  def self.my_class_method
    'My class method'
  end

  def self.my_second_class_method
    'My second class method'
  end

  private_class_method :my_second_class_method

  def my_private_method
    'My private method'
  end

  private :my_private_method

  private

  def second_private_method
    'Second private method'
  end

  protected

  def my_protected_method
    'My protected method'
  end

end

class SpritelySpaceship < Spaceship

  def test_protected_method
    my_protected_method
  end

end


#################################################

spaceship = Spaceship.new

#################################################

headline('Inspect element')

spaceship.launch('Earth')
puts spaceship.inspect    #<Spaceship:0x000000016972a0 @creation_date="26/03/2016 13:35:21", @destination="Earth">
p spaceship

headline('Accessing private methods')

# Private methods are not accessible
begin
  puts spaceship.my_private_method
rescue NoMethodError => ex
  puts ex.message     # private method `my_private_method' called for #<Spaceship:0x00000001681b58>
end

begin
  puts spaceship.second_private_method
rescue NoMethodError => ex
  puts ex.message     # private method `second_private_method' called for #<Spaceship:0x000000012f0f48>
end

# But I can call private method by using .send
puts spaceship.send(:my_private_method)

headline('Class methods')

puts Spaceship.my_class_method

headline('Private class methods')

# Private class methods are not accessible
begin
  puts Spaceship.my_second_class_method
rescue NoMethodError => ex
  puts ex.message     # private method `my_second_class_method' called for Spaceship:Class
end

# But I can call a private class method by using .send
puts Spaceship.send(:my_second_class_method)

headline('Protected methods')

# Protected methods are only accesible for objects of the same class
puts SpritelySpaceship.new.test_protected_method

# Protected methods are not accessible
begin
  puts spaceship.my_protected_method
rescue NoMethodError => ex
  puts ex.message     # protected method `my_protected_method' called for #<Spaceship:0x000000021f4f58
end

# But I can call a protected method by using .send
puts spaceship.send(:my_protected_method)

headline('Open classes')

class Car
  def wheels
    4
  end
end

car = Car.new
puts car.wheels

begin
  puts car.how_many_wheels
rescue NoMethodError => ex
  puts ex.message     # undefined method `how_many_wheels' for #<Car:0x000000015bd410>
end

separator

class Car
  def how_many_wheels
    "#{wheels} in total"
  end
end

second_car = Car.new
puts second_car.wheels
puts second_car.how_many_wheels

separator

# Monkey patching - Method override
class Car
  def how_many_wheels
    "#{wheels} I guess"
  end
end
third_car = Car.new
puts third_car.how_many_wheels
