require_relative 'helpers'

header('Integer class')

headline('FixNum and BigNum')

# the main difference is the size in memory required to store the value
puts Fixnum.superclass
puts Bignum.superclass

headline('methods')

4.upto(6) { |i| puts i }

separator

8.downto(5) { |i| puts i }

separator

3.times {puts 'Hello!'}

separator

# Iterates from 1 to 10 incrementing i by 3 on each iteration
1.step(10, 3){|i| puts i }

1.step(to: 4){|i| puts i}
1.step(by: 3)
