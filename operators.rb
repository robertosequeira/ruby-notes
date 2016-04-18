require_relative 'helpers'

# http://ruby-doc.org/core-2.3.0/doc/syntax/precedence_rdoc.html

header('Operators')

# Comparison
# > >= < <= == !=

# Mathematical
# + - * / % **(exponentiation)

headline('Logical')

# Logical
# ! && ||
# not and or (precedence)(used for flow control out of control structures such as if/else)

# and and or have much lower precedence that && and ||
# && has higher precedence than ||
# and and or have the same precedence

nil || 42     # 42
42 && 23      # 23

nil or 42     # 42
42 and 23     # 23

user = Struct.new(:name).new('Roberto')

# Exectuted as:
# username = (user && user.name)
username = user && user.name
puts username       # Roberto

# Exectuted as:
# (username = user) and user.name
# Because of the lower precedence of and in relation to =
username = user and user.name
puts username       #<struct name="Roberto">

# Exectuted as:
# 'a' || ('b' && nil)
# Because && has higher precedence than ||
'a' || 'b' && nil     # a

'a' or 'b' and nil     # nil
# Exectuted as:
# ('a' or 'b') and nil     # nil
# Because or and and has the same precedence so they are evaluated from left to right


# Bitwise integer
# & | ^ ~ << >>

# Assignment
# += -= *= /= %= **= &= |= ^= >>= <<=

headline('Splat')

# acumulates as many values as posible in a variable
a, *b = [1, 2, 3, 4]
p a                             # 1
p b                             # [2, 3, 4]

separator

a, *b, c = [1, 2, 3,4 ]
p a                             # 1
p b                             # [2, 3]
p c                             # 4

separator

a,b,c = *1..3
puts a                             # 1
puts b                             # 2
puts c                             # 3

separator

first, _, _, last =   1, *[2, 3, 4]
puts first                        # 1
puts last                         # 4

headline('On elements that has a to_a method')

first, *, last =   1, *2..45
puts first                        # 1
puts last                         # 45

separator

r = (3..10)
p [1, 2, *r]                      # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

separator

h = {a: 'a', b: 'b'}
p [*h]                            # [[:a, "a"], [:b, "b"]]
