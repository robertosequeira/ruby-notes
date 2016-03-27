require_relative 'helpers'

#http://ruby-doc.org/core-2.3.0/doc/syntax/control_expressions_rdoc.html

header('Conditional branching')

def is_it_true?
  true
end

def it_is_true
  "It's true"
end

def it_is_false
  "It's false"
end

headline('if/elsif/else')

if is_it_true?
  puts it_is_true
else
  puts it_is_false
end

message = if is_it_true? then it_is_true else it_is_false end
puts message

puts 'Hello!' if is_it_true?

puts is_it_true? ? it_is_true : it_is_false

headline('and/or')
# and and or are intended to be used for flow control
# while && and || are intended to be used in conditional statements

name = nil
puts (name and name.upcase and name.reverse)      #

name = 'Roberto'
puts (name and name.upcase and name.reverse)      #otreboR

headline('Unless')
# Same as if but testing for false

headline('Case')

text = 'foo'
case text
  when 'bar'
    puts 'bar'
  when 'foo'
    puts 'foo'
  else
    puts 'Something else'
end

number = 15
case
  when number < 10
    puts 'Less than 10'
  when number < 20
    puts 'Less than 20'
  else
    puts '20 or more'
end

