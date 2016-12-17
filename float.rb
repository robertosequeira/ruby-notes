require_relative 'helpers'

header('Float')

headline('Declaration')

puts 1.234        # 1.234
puts 1.30e3       # 1300.0
puts 10.25 + 32   # 42.25
puts 32 + 10.25   # 42.25

headline('Methods')

# absolute value
puts -15.24.abs   # 15.24

# rounding
puts 3.4.ceil     # 4
puts 3.6.floor    # 3
puts 4.2.round    # 4
puts 4.5.round    # 5

p 8.coerce(6)     # [6, 8]
p 6.coerce(8.5)   # [8.5, 6.0]
p 8.5.coerce(6)   # [6.0, 8.5]

p 13.divmod(5)    # [2, 3]

headline('---------')

puts 7.4.integer?   # false
puts 7.integer?     # true

headline('---------')

puts 6.8.negative?      # false
puts -6.8.negative?     # true

headline('---------')

p 2.nonzero?        # false
p 0.nonzero?        # nil
p 0.0.nonzero?      # nil
