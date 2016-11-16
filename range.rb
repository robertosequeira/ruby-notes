require_relative 'helpers'

header('Range')

headline('Define ranges')

r = Range.new(1,5)
r = 1..5
puts r.class                        # range
puts r.begin                        # 1
puts r.end                          # 5
puts r.exclude_end?                 # false

p r.to_a                            # [1, 2, 3, 4, 5]

r = Range.new(1,5, true)
# r = 1...5

puts r.begin                        # 1
puts r.end                          # 5
puts r.exclude_end?                 # true
p r.to_a                            # [1, 2, 3, 4]


headline('Methods')

# Returns true is the object is one element of the range
r = 10..40

puts r.include?(8)                  # false
puts r.include?(22)                 # true
puts r.member?(22)                  # true
puts r.cover?(22)                   # true
puts ('a'..'f').include?('d')       # true

separator

r = 1..100
p r.step(12).to_a             # [1, 13, 25, 37, 49, 61, 73, 85, 97]

r = 1..10
p r.step(2).to_a              # [1, 3, 5, 7, 9]
p r.step(3).to_a              # [1, 4, 7, 10]

separator

r = 25..50
puts r.first                 # 25
p r.first(3)                 # [25, 26, 27]

puts r.last                  # 50
p r.last(3)                  # [48, 49, 50]

separator

r = 15..32

puts r.min                           # 15
puts r.min { |a, b| a <=> b }        # 15
puts r.min { |a, b| b <=> a }        # 32
puts r.max                           # 32
puts r.max { |a, b| a <=> b }        # 32
puts r.max { |a, b| b <=> a }        # 15

separator

puts (1..10).size                  # 11
puts (1..20).size                  # 20
puts (10..25).size                 # 16
