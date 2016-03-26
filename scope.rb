require_relative 'helpers'

$im_global = 5


foo = 10

def bar
  foo = 5
  puts foo
end

bar
puts foo

