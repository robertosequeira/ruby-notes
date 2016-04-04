require_relative 'helpers'

header('Exceptions')

begin
  3 / 0
rescue
  puts 'Ups!'
end

separator

def my_method
  3/0
  true
rescue
  puts 'Error in my method!'
  false
end

puts my_method

separator

begin
  3/0
rescue StandardError
  puts 'StandardError'
rescue
  puts 'Some other error'
end

separator

def my_second_method
  raise 'What an error!'
end

begin
  my_second_method
rescue RuntimeError
  puts 'raise by default throws a RuntimeError'
end

separator

def my_third_method
  raise ArgumentError, 'What an argument error!'
end

begin
  my_third_method
rescue ArgumentError
  puts 'Error type can be specified'
end

separator

begin
  my_third_method
rescue
  # $! refers to the last exception raised, it's the same as using Exception => e; e.message
  puts $!.message
end

separator
