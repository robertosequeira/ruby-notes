require_relative 'helpers'

header('Range')

headline('Define ranges')

r = 1..5
puts r.class                        # range
puts r.begin                        # 1
puts r.end                          # 5

headline('Methods')

# Returns true is the object is one element of the range
puts (10..40).include?(8)           # false
puts (10..40).include?(22)          # true
puts (10..40).member?(22)           # true
puts ('a'..'f').include?('d')       # true

separator

p (1..100).step(12).to_a            # [1, 13, 25, 37, 49, 61, 73, 85, 97]

separator

puts (1..10).cover?(8)


separator

puts (1..5).exclude_end?            # false
puts (1...5).exclude_end?           # true

separator

puts (25..50).first                 # 25
p (25..50).first(3)                 # [25, 26, 27]

puts (25..50).last                  # 50
p (25..50).last(3)                  # [48, 49, 50]

separator

puts (15..32).min                           # 15
puts (15..32).min { |a, b| a <=> b }        # 15
puts (15..32).min { |a, b| b <=> a }        # 32
puts (15..32).max                           # 32
puts (15..32).max { |a, b| a <=> b }        # 32
puts (15..32).max { |a, b| b <=> a }        # 15

separator

puts (22..32).size                  # 11
