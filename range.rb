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
puts ('a'..'f').include?('d')       # true

