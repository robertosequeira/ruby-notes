require_relative 'helpers'

header('Modules')

headline('Module declaration')

# modules cannot be instantiated
module API
  def self.version
    '1.0'
  end
end

puts API.version                      # 1.0

module App
  module API
    def self.version
      '2.0'
    end
  end
end

puts App::API.version                 # 2.0

headline('Mixins')

module SomeModule
  def first_method
    'First method'
  end
end

class SomeClass
  # module instance methods are included as instance methods
  include SomeModule
end

my_class = SomeClass.new
puts my_class.first_method            # First method

separator

class OtherClass
  # module instance methods are included as class methods
  extend SomeModule
end

puts OtherClass.first_method            # First method


