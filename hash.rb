require_relative 'helpers'

header('Hash')

headline('Define hashes')

h = Hash.new
h[:a] = 'a'
puts h                              # {:a=>"a"}

h = {a: 'a', b: 'b'}
puts h                              # {:a=>"a", :b=>"b"}

h = Hash.new('Default value')
puts h[:a]                          # Default value

separator

headline('Methods')

h = {a: 'a', b: 'b'}
p h.keys                            # [:a, :b]
p h.values                          # ["a", "b"]

separator

h.each { |h| p h }                   # [:a, "a"] - [:b, "b"]
h.each { |k, v| puts "#{k}: #{v}" }  # a: a - b: b



