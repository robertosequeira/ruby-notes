require_relative 'helpers'

#http://ruby-doc.org/core-2.3.0/Method.html#method-i-arity

header('Methods')

headline('Public methods')

# puts String.public_methods.sort
# puts Integer.public_methods.sort

headline('Splat operator')

# arguments are captured by options which is a array
def my_method(*options)
  options
end
p my_method                                         # []
p my_method('a', 'b', 'c')                          # ["a", "b", "c"]

separator
options = ['f', 'g']
p my_method('a', options)                           # ["a", ["f", "g"]]
# splat operator can be used to expand a array
# this is getting a list of comma separated elements
p my_method('a', *options)                          # ["a", "f", "g"]

headline('Double splat operator')

# key/value arguments are captured in options which is a hash
def my_second_method(**options)
  options
end
p my_second_method                                  # {}
p my_second_method(a: 'a', b: 'b')                  # {:a=>"a", :b=>"b"}

options = {f: 'f', g: 'g'}
# not even valid syntax as method expects key/value pairs
# p my_second_method(a: 'a', options)
p my_second_method(a: 'a', **options)               # {:a=>"a", :f=>"f", :g=>"g"}

headline('Alias method')

# Useful if you need to overwrite a method but you also need to keep access to old method
# For example it you are monkey patching classes
class MyClass

  def original_method
    'Original method'
  end
  alias_method :old_original_method, :original_method

  def original_method
    'New original method'
  end
end

my_class = MyClass.new

p my_class.original_method                        # "New original method"
p my_class.old_original_method                    # "Original method"

headline('Method missing')

class Garage

  # Create a interface to handle common find actions
  def method_missing(name, *args)
    case name
      when /^find_by_([a-z]+)_and_([a-z]+)$/
        find($1.to_sym => args[0], $2.to_sym => args[1])
      when /^find_by_([a-z]+)$/
        find($1.to_sym => args[0])
      else
        # super must be called so the default behavior is executed if the method requested
        # does not exist
        super
    end
  end

  def respond_to?(name, *args)
    return true if name =~ /^find_by_([a-z]+)_and_([a-z]+)$/ || name =~ /^find_by_([a-z]+)$/
    super
  end

  private

  def find(attrs)
    "Finding cars by #{attrs.inspect}"
  end
end

garage = Garage.new
puts garage.find_by_color('red')                        # Finding cars by {:color=>"red"}
puts garage.find_by_color_and_fuel('red', 'gasoline')   # Finding cars by {:color=>"red", :fuel=>"gasoline"}


separator

p garage.respond_to?(:find_by_doors)                    # true
p garage.respond_to?(:find_by_doors_and_color)          # true
p garage.respond_to?(:find_by_doors_or_color)           # false
