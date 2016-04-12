require_relative 'helpers'

$im_global = 5

foo = 10

# the method has its own scope so foo refers to a different object and
# not the object containing 10
def bar
  foo = 5
  puts foo
end

bar

puts foo

