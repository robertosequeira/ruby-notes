require_relative 'helpers'

header('Range')

headline('Define ranges')

r = 1..5
puts r.class                        # range
puts r.begin                        # 1
puts r.end                          # 5

headline('Methods')

puts (10..40).include?(8)           # false
puts (10..40).include?(22)          # true
puts (10..40).member?(22)           # true
puts ('a'..'f').include?('d')       # true

separator

p (1..100).step(12).to_a            # [1, 13, 25, 37, 49, 61, 73, 85, 97]

separator

puts (1..10).cover?(8)
