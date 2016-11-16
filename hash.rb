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

separator

h = {a: 'a', b: 'b'}

puts h.has_key?(:a)                 # true
puts h.key?(:a)                     # true
puts h.has_value?('a')              # true
puts h.value?('b')                  # true
puts h.include?(:a)                 # true
puts h.member?(:a)                  # true

separator

h = {a: 'a', b: 'b'}

puts h.clear                    # {}

separator

h = {a: 'a', b: 'b'}

puts h.store(:c, 'c')                 # c
puts h                                # {:a=>"a", :b=>"b", :c=>"c"}

separator

h = { 'a' => 100, 'b' => 200 }

p h.delete('a')                           # 100
p h.delete('z')                           # nil

separator

h1 = { 'a' => 1, 'b' => 200 }
h2 = { 'b' => 3, 'c' => 4 }

puts h1.merge(h2)   #=> {"a"=>1, "b"=>3, "c"=>4}

separator

h = {a: 1, b: 2}

h.each_key { |k| puts k }                 # a b
h.each_value { |v| puts v }               # 1 2
h.each_pair { |k, v| puts "#{k} : #{v}" } # a : 1  b : 2

headline('Reduce')

a = [1, 2]
puts a.reduce(&:+)                   # 3
puts a.reduce(0) { |m, n| m += n}    # 3

separator

h = {a: 1, b: 2}
puts h.reduce(0) { |m, pair| m += pair[1]}  # 3
puts h.reduce(0) { |m, (k,v)| m += v}       # 3


