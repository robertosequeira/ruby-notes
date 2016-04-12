# http://ruby-doc.org/core-2.3.0/doc/syntax/literals_rdoc.html
# https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals

# Hexadecimal
puts 0xAF     # 175

# Octal
puts 010      # 8
puts 0o10     # 8

# Decimal
puts 0d475    # 475
puts 256_413  # 256413

# Binary
puts 0b1010   # 10

# Regular expression
p %r(\d+)

# Arrays
p %w(1\ array of words)       # ["1 array", "of", "words"]
foo = 'words'
p %W(1\tarray\ of #{foo})     # ["1\tarray of", "words"]

# Symbols
p %i(a b c)                   # [:a, :b, :c]

