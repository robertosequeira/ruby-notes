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

headline('while/until')


continue_while = true

number = 0
while continue_while
  puts number += 1
  continue_while = false if number > 2
end

separator

number = 0
puts number += 1 while number < 3

separator

number = 0
until continue_while
  puts number += 1
  continue_while = true if number > 4
end

separator

number = 0
puts number += 1 until number > 2

separator

number = 0
begin
  puts number += 1
end while number < 4

separator

number = 0
begin
  puts number += 1
end until number > 4

headline('for')

for i in %w(a b c)
  puts i
end

headline('iterators')

%w(a b c).each do |i|
  puts i
end

separator

%w(a b c).each {|i| puts i }


headline('Loop flow')

number = 0
while number <  5
  number += 1
  # next
  next if number % 2 == 0
  puts number
end

separator

number = 0
while number <  5
  number += 1
  # next
  break if number == 2
  puts number
end

separator

number = 0
while number <  2
  print 'Please enter a positive number: '
  input = gets.to_i

  # redo
  redo if input <= 0
  number += 1
end
