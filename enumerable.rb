require_relative 'helpers'

# http://ruby-doc.org/core-2.3.0/Enumerable.html

header('Enumerable')

headline('Methods')

arr = [1, 3, 4, 2, 5]

p arr.map { |n| n*2 }                         # [2, 6, 8, 4, 10]
p arr.select { |n| n.even? }                  # [4, 2]
p arr.reject { |n| n.even?}                   # [1, 3, 5]
p arr.sort                                    # [1, 2, 3, 4, 5]

separator

# each n consecutive elements
arr.each_cons(3){|g| p g}                     # [1, 3, 4] [3, 4, 2] [4, 2, 5]

separator

puts arr.all? { |n| n.even? }                 # false
puts arr.all?(&:even?)                        # false

puts arr.any? { |n| n.even? }                 # true
puts arr.any?(&:even?)                        # true

separator

#arr.collect_concat == arr.flat_map
p arr.flat_map { |n| [n, -n] }                # [1, -1, 3, -3, 4, -4, 2, -2, 5, -5]

separator

puts arr.count                                # 5
puts arr.count(3)                             # 1
puts arr.count{ |n| n.even? }                 # 2

# arr.cicle

separator

# returns the first element for which block is not false
# same as find
puts arr.detect { |n| n.even? }               # 4
puts arr.find {|n| n.even? }                  # 4
puts arr.find(&:even?)                        # 4

separator

arr = %w(a b c d e f g)
# gets slices of n elements
arr.each_slice(3) { |slice| p slice }        # ["a", "b", "c"] ["d", "e", "f"] ["g"]

separator

arr = %w(a b)
arr.each_with_index { |item, index| p [item, index]}  # ["a", 0] ["b", 1]
arr.each.with_index { |item, index| p [item, index]}  # ["a", 0] ["b", 1]

separator

arr = %w(a b)
# each_with_object passes the same memo to all iterations
p arr.each_with_object({}) { |v, a| a[v] = v }        # {"a"=>"a", "b"=>"b"}
p arr.each_with_object([]) { |v, a| a << v }          # ["a", "b"]

# in reduce the result becomes the new value for the memo
# same as inject
p arr.reduce({}) { |a, v| a[v] = v; a }               # {"a"=>"a", "b"=>"b"}

separator

arr = [1, 2, 3, 4]
# returns all values for which the given block returns a true value
# same as select
p arr.find_all {|n| n.odd? }                # [1, 3]
p arr.find_all(&:odd?)                      # [1, 3]
p arr.select(&:odd?)                        # [1, 3]

separator

arr = %w(a b c d)
puts arr.find_index('b')                    # 1
puts arr.find_index {|v| v == 'b'}          # 1

separator

arr = %w(a b c d)
puts arr.first                              # a
p arr.first(2)                              # ["a", "b"]

separator

p (1..10).grep(3..5)                        # [3, 4, 5]
p  %w(hello foo bar block).grep(/lo/)       # ["hello", "block"]

# not available in 2.1.5
# p (1..10).grep_v(3..5)                               # [3, 4, 5]
# p  %w(hello foo bar block).grep_v(/lo/)              # ["hello", "block"]

separator

p %w(hello foo test var array).group_by(&:length)     # {5=>["hello", "array"], 3=>["foo", "var"], 4=>["test"]}

separator

# returns true is any member equals object
# same as member
puts %w(a b c).include?('a')                # true
puts ({ a: 'a', b: 'b'}.include?(:a))       # true
puts %w(a b c).member?('a')                 # true

separator

arr = %w(hello foo test var array)
# assumes objects implement <=>
puts arr.max                                          # var
puts arr.max { |a, b| a.length <=> b.length }         # hello
puts arr.max_by { |w| w.length }                      # hello
puts arr.max_by(&:length)                             # hello

separator

arr = %w(hello foo test var array)
puts arr.min                                          # array
puts arr.min { |a, b| a.length <=> b.length }         # foo
puts arr.min_by { |w| w.length }                      # foo
puts arr.min_by(&:length)                             # foo

separator

arr = %w(hello foo test var array)
p arr.minmax                                          # ["array", "var"]
p arr.minmax { |a, b| a.length <=> b.length }         # ["foo", "hello"]
p arr.minmax_by { |w| w.length }                      # ["foo", "hello"]
p arr.minmax_by(&:length)                             # ["foo", "hello"]

separator

arr = [1, 2, 3, 4]
# returns true if the block never returns true for all elements
puts arr.none? { |v| v >= 5 }                         # true
puts arr.none? { |v| v >= 4 }                         # false

separator

arr = [1, 2, 3, 4]
# returns true if the block returns true exactly once
puts arr.one? { |v| v >= 4 }                # true
puts arr.one? { |v| v >= 3 }                # false

separator

p (1..8).partition { |v| v.even? }          # [[2, 4, 6, 8], [1, 3, 5, 7]]
p (1..8).partition(&:even?)                 # [[2, 4, 6, 8], [1, 3, 5, 7]]

separator

('a'..'d').reverse_each { |l| puts l }      # d c b a

separator

arr = %w(hello foo test var array)
p arr.sort                                          # ["array", "foo", "hello", "test", "var"]
p arr.sort { |a, b| a.length <=> b.length }         # ["var", "foo", "test", "hello", "array"]
p arr.sort { |a, b| b.length <=> a.length }         # ["hello", "array", "test", "var", "foo"]
p arr.sort_by { |w| w.length }                      # ["var", "foo", "test", "hello", "array"]
p arr.sort_by(&:length)                             # ["var", "foo", "test", "hello", "array"]

separator

p (4..10).take(1)                           # [4]
p (4..10).take(3)                           # [4, 5, 6]
p (4..10).take_while { |n| n < 6}           # [4, 5]

separator

p [1, 2].zip(['a', 'b'])                    # [[1, "a"], [2, "b"]]
p [1, 2, 3].zip(['a', 'b'])                 # [[1, "a"], [2, "b"], [3, nil]]
p [1].zip(['a', 'b'])                       # [[1, "a"]]

h = {a: 'a', b: 'b'}
h2 = {c: 'c', d: 'd'}
p (h.zip(h2))                               # [[[:a, "a"], [:c, "c"]], [[:b, "b"], [:d, "d"]]]
