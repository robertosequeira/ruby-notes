require_relative 'helpers'

# http://ruby-doc.org/core-2.3.0/Array.html

header('Arrays')

headline('Array definition')

# an array stores references to object
p [1, 2, 3]                   # [1, 2, 3]
# an array can store elements of different types
p [1, 'Roberto', :foo]        # [1, "Roberto", :foo]

separator

# you can specify the array size and by default all elements are set to nil
# or you can specify a default value but it has to be read only
p Array.new(3)                    # [nil, nil, nil]
p Array.new(3, true)              # [true, true, true]

separator

# as all elements are references to the same object if one element is changed actually
# all elements are updated
p arr = Array.new(3, 'hello')     # ["hello", "hello", "hello"]
arr.first.upcase!
p arr                             # ["HELLO", "HELLO", "HELLO"]

separator

# by sending a block then every element refers to a different object
p arr = Array.new(3) { 'abc' }    # ["abc", "abc", "abc"]
arr.last.upcase!
p arr                             # ["abc", "abc", "ABC"]

separator

# multidimensional array
p Array.new(3, Array.new(2))      # [[nil, nil], [nil, nil], [nil, nil]]

headline('Methods')

p arr = %w(a b c d)               # ["a", "b", "c", "d"]
puts arr.size                     # 4
puts arr.empty?                   # false
puts arr.first                    # a
puts arr.last                     # d
puts arr.any?                     # true
puts arr.at(2)                    # c
p arr.collect {|i| "-#{i}-" }     # ["-a-", "-b-", "-c-", "-d-"]
p arr.map {|i| "-#{i}-"}          # ["-a-", "-b-", "-c-", "-d-"]

separator

# Get all combinations of length n
p arr.combination(3).to_a         # [["a", "b", "c"], ["a", "b", "d"], ["a", "c", "d"], ["b", "c", "d"]]
p ['a', nil, 'c', nil].compact    # ["a", "c"]

separator

# append other array to self, array gets modified
p arr.concat(%w(e f g))           # ["a", "b", "c", "d", "e", "f", "g"]
puts arr.count                    # 7
p %w(black white).cycle(2).to_a   # ["black", "white", "black", "white"]

separator

# deletes and returns the deleted element. Array is updated
arr = %w(a b c d)
puts arr.delete('c')              # c
p arr.delete('z')                 # nil
p arr                             # ["a", "b", "d"]

separator

# deletes and returns the deleted element. Array is updated
# similar to slice
arr = %w(a b c d)
puts arr.delete_at(1)             # b
p arr                             # ["a", "c", "d"]

separator

# deletes and returns the deleted element. Array is updated
# similar to reject
arr = [1, 2, 3, 4, 5]
p arr.delete_if{|n| n < 3}        # [3, 4, 5]
p arr                             # [3, 4, 5]

separator

arr = %w(a b c d)
p arr.drop(2)                     # ["c", "d"]
p arr.take(2)                     # ["a", "b"]

separator

arr.each { |c| puts c}            # a b c d
arr.each_index { |i| puts i}      # 0 1 2 3

separator

arr = [1, 2]
p arr.push(3)                     # [1, 2, 3]
p arr.unshift(0)                  # [0, 1, 2, 3]
p arr.pop                         # 3
p arr.shift                       # 0
p arr                             # [1, 2]
p arr.insert(1, 1.5)              # [1, 1.5, 2]


# # TODO
# arr = %w(foo bar)
# arr.flatten
# arr.frozen?
# arr.select {|a| a < 3}
# arr.reject {|a| a < 3}
# arr.rotate
# arr.reverse
# arr.sample
# arr.shuffle
# arr.sort
# arr.sort_by {|a,b| a <=> b }
# arr.uniq
# arr.transpose
# arr.values_at(2,3)
# arr.zip(['a', 'b'])
# arr.clear                       # []

headline('Access elements')

arr = [1, 2, 3, 4, 5, 6, 7, 8]
p arr[2, 4]                       # [3, 4, 5, 6] - four elements starting at index 2
p arr[-4, 2]                      # [5, 6] - two elements starting at index -4
p arr[1..3]                       # [2, 3, 4] - indexes 1, 2 and 3
p arr[3..-3]                      # [4, 5, 6] - negative index starts counting from the end of the array
p arr[-3..-1]                     # [7, 8, 9] - negative index starts counting from the end of the array

headline('Operations')

# replace some elements
arr = [1, 2, 3, 4, 5]
arr[2..3] = [8, 9]
p arr                             # [1, 2, 8, 9, 5]

separator

# append
arr = [1, 2]
arr << 'a'                        # [1, 2, "a"]
p arr                             # [1, 2, 8, 9, 5, "a"]

separator

# repetition
p [1, 2] * 3                      # [1, 2, 1, 2, 1, 2]
# concatenation
p [1, 2] + [3, 4]                 # [1, 2, 3, 4]
# difference
p [1, 2, 3, 4, 2, 5] - [2, 5]     # [1, 3, 4]

separator

# intersection - elements common to the 2 arrays excluding duplicates
p %w(a b c d e c) & %w(b c f)     # ["b", "c"]

# union - joins 2 arrays, removes all duplicates and preserves original order
p %w(a b c d) | %w(b d f g)       # ["a", "b", "c", "d", "f", "g"]


p [1, 2] * ', '                   # "1, 2" - Similar to join
