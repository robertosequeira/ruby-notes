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

nil || 42     #42
42 && 23      #23

nil or 42     #42
42 and 23     #23

user = Struct.new(:name).new('Roberto')

#Exectuted as:
# username = (user && user.name)
username = user && user.name
puts username       #Roberto

#Exectuted as:
# (username = user) and user.name
# Because of the lower precedence of and in relation to =
username = user and user.name
puts username       #<struct name="Roberto">

# Exectuted as:
# 'a' || ('b' && nil)
# Because && has higher precedence than ||
'a' || 'b' && nil     #a

'a' or 'b' and nil     #nil
# Exectuted as:
#('a' or 'b') and nil     #nil
# Because or and and has the same precedence so they are evaluated from left to right


# Bitwise integer
# & | ^ ~ << >>

# Assignment
# += -= *= /= %= **= &= |= ^= >>= <<=
