require_relative 'helpers'

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

headline('Methods')

p arr = %w(a b c d)               # ["a", "b", "c", "d"]
puts arr.size                     # 4
puts arr.empty?                   # false
puts arr.first                    # a
puts arr.last                     # d

separator

arr = [1, 2, 3, 4, 5, 6, 7, 8]
p arr[2, 4]                       # [3, 4, 5, 6] - four elements starting at index 2
p arr[-4, 2]                      # [5, 6] - two elements starting at index -4
p arr[1..3]                       # [2, 3, 4] - indexes 1, 2 and 3
p arr[3..-3]                      # [4, 5, 6] - negative index starts counting from the end of the array
p arr[-3..-1]                     # [7, 8, 9] - negative index starts counting from the end of the array

