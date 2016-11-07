require_relative 'helpers'

# https://ruby-doc.org/core-2.3.1/Enumerator.html

header('Enumerator')

arr = [1, 2, 3, 4, 5]

enum = arr.map

headline('Methods')

p enum.size     # 5
p enum.next     # 1
p enum.peek     # 2
p enum.next     # 2

enum.rewind

p enum.next     # 1

enum.rewind

p enum.each {|item| item * 2 } # [2, 4, 6, 8, 10]

headline('Chain enumerators')

enum = arr.each
enum = enum.with_index
enum.each {|e, i| p [i, e]}  # [0, 1] [1, 2] [2, 3] [3, 4] [4, 5]
