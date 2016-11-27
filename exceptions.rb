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

# I  can raise an error
def my_second_method
  raise 'What an error!'
end

begin
  my_second_method
rescue RuntimeError
  puts 'raise by default throws a RuntimeError'
end

separator

# I can specify the error type when I raise an error
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

# rescue/else/ensure
def rescue_else_ensure
  3/1
rescue
  puts 'Something went wrong'
else
  puts 'great! not errors.'
ensure
  puts 'Cleaning up everything!'
end

puts rescue_else_ensure
# great! not errors.
# Cleaning up everything!

separator

# retry is useful for example if you are calling an API that usually fails
def rescue_retry
  3/0
rescue Exception => e
  attempts ||= 0
  attempts += 1

  if attempts < 3
    puts e.message + '. Retrying'
    # retry returns the execution to the beginning of the method
    retry
  else
    puts 'No way! It failed'
    raise
  end
end

begin
  puts rescue_retry
rescue
  puts 'retry failed'
end
