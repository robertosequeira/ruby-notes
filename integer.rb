require_relative 'helpers'

header('Integer class')

headline('FixNum and BigNum')

# the main difference is the size in memory required to store the value
puts Fixnum.superclass            # Integer
puts Bignum.superclass            # Integer

puts 1.class                        # Fixnum
puts 1.size                         # 8
puts 12345678901234567890.class     # Bignum
puts 12345678901234567890.size      # 8

headline('methods')

4.upto(6) { |i| puts i }          # 4 - 5 - 6

separator

8.downto(5) { |i| puts i }        # 8 - 7 - 6 - 5

separator

3.times {puts 'Hello!'}           # Hello!-Hello!-Hello!

separator

# Iterates from 1 to 10 incrementing i by 3 on each iteration
1.step(10, 3){|i| puts i }        # 1 - 4 -7 - 10

separator

1.step(to: 4){|i| puts i}         # 1 - 2 - 3 - 4

separator

p 1.step(by: 3).first(3)          # [1, 4, 7]

separator

puts 'A'.codepoints                           # 65
puts 65.chr                                   # A
puts 65.chr(Encoding::UTF_8)
puts 65.chr('Foo') rescue puts $!.message     # unknown encoding name - Foo

separator

puts 25.even?                                 # false
puts 25.odd?                                  # true

separator

puts 15.next                                  # 16
puts 15.succ                                  # 16

puts 15.pred                                  # 14

separator

puts 14.round                                 # 14
puts 14.round(1)                              # 14.0
puts 14.round(-1)                             # 10
puts 15.round(-1)                             # 20
