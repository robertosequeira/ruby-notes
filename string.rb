require_relative 'helpers'

header('String')

# Default encoding is UTF-8
p 'abc'.encoding              # #<Encoding:UTF-8>
puts 'abc'.encoding.name      # UTF-8

headline('Define strings')

puts %q('Hello')

separator

puts "'Hello'"
puts "\tHello"            # tab
puts "Hello\nWorld"       # new line

foo = 'World'
puts %"hello #{foo}"
puts %Q(hello #{foo})
puts %(hello #{foo})

separator

message = <<EOS
  Hello there!
  It's a sunny day
EOS
puts message

separator

message = <<demo
  Hello there!
  It's a demo
demo

puts message

headline('')

foo = 'Hello world!'

puts foo[3]         # l
puts foo[3, 4]      # lo w
puts foo['or']      # or
puts foo['ab']      # nil

headline('Replace text')

bar = 'Hello Roberto'
puts bar              # Hello Roberto
bar['Hello'] = 'Bye'
puts bar              # Bye Roberto

headline('Formated output')

puts '%05d' % 123                     # 00123
puts '%0.8g' % 123.456789123456       # 123.45679

headline('methods')
# unicode characters
foo = "~ 5\u{20ac}"
puts foo                              # ~ 5€
p foo.chars                           # ["~", " ", "5", "€"]
p foo.codepoints                      # [126, 32, 53, 8364]
p foo.bytes                           # [126, 32, 53, 226, 130, 172]

separator

foo = 'hello'

foo.each_char { |c| puts c }

separator

foo.each_codepoint { |c| puts c }

separator

foo.each_byte { |b| puts b }

separator

foo = 'hello'
puts foo.upcase         # HELLO
puts foo.upcase!        # HELLO

separator

puts foo.downcase       # hello
puts foo.downcase!      # hello

separator

foo = 'hello test user, hello'
puts foo.sub('hello', 'bye')        # bye test user, hello
puts foo.gsub('hello', 'bye')       # bye test user, bye

separator

# by default split separates by space
foo = 'hello test user'
p foo.split                         # ["hello", "test", "user"]
# a separator can be specified
foo = 'hello,test,user'
p foo.split(',')                    # ["hello", "test", "user"]

separator

puts 'hello'.delete 'l','lo'        # heo
puts 'hello'.delete 'lo'            # he
puts 'hello'.delete 'aeiou', '^e'   # hell
puts 'hello'.delete 'ej-m'          # ho

separator

p 'a'.upto('d').to_a                # ["a", "b", "c", "d"]

separator

p "hello".chomp                # "hello"
p "hello\n".chomp              # "hello"
p "hello\r".chomp              # "hello"
p "hello\r\n".chomp            # "hello"

p "hello\n\r".chomp            # "hello\n"

separator

p "hello".chop                # "hell"
p "hello\n".chop              # "hello"


separator

# empty spaces = null, horizontal tab, line feed, vertical tab,
# form feed, carriage return, space.
p "  hello  ".strip             # "hello"
p "\n  hello  \n".strip         # "hello"
p "\r  hello  \r".strip         # "hello"
p "\r\n  hello  \r\n".strip     # "hello"
p "\r\n\t hello  \r\n\t".strip  # "hello"

separator

p "  hello  ".lstrip         # "hello  "
p "  hello  ".rstrip         # "  hello"

separator

s = 'my number is 1234 567 890'
m = s.match('[0-9]{4} [0-9]{3} [0-9]{3}')
m = s.match('\d{4} \d{3} \d{3}')
m = s.match(/\d{4} \d{3} \d{3}/)

p m             # #<MatchData "1234 567 890">
puts m[0]       # 1234 567 890

m = s.match(/\d{4} \d{4} \d{4}/)

p m             # nil

m = s.match(/(\d{4}) (\d{3}) (\d{3})/)
puts m[0]       # 1234 567 890
puts m[1]       # 1234
puts m[2]       # 567
puts m[3]       # 890

separator

s = 'Hello world! Developers everywhere'

p s.scan(/\w+/)       # ["Hello", "world", "Developers", "everywhere"]
p s.scan(/\w+ \w+/)   # ["Hello world", "Developers everywhere"]

s = '1234 567 890 0987 654 321 2345 678 901'

p s.scan(/\d{4} \d{3} \d{3}/) # ["1234 567 890", "0987 654 321", "2345 678 901"]


separator

# https://ruby-doc.org/core-2.3.1/Kernel.html#method-i-sprintf
# %[flags][width][.precision]type

p "%05d" % 10                               #=> "00123"
p "%-5s: %08x" % [ "ID", self.object_id ]   #=> "ID   : 200e14d6"
p "foo = %{foo}" % { :foo => 'bar' }        #=> "foo = bar"


separator

p "%b %o %d %x" % [10, 10, 10, 10]          # "1010 12 10 a"
