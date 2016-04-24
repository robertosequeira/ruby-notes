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

puts '%05d' % 123
puts '%0.8g' % 123.456789123456

headline('methods')
# unicode characters
foo = "~ 5\u{20ac}"
puts foo
p foo.chars
p foo.codepoints
p foo.bytes

separator
foo = 'hello'

foo.each_char{|c| puts c}

separator

foo.each_codepoint{|c| puts c}

separator

foo.each_byte{|b| puts b}

separator

puts foo.upcase
puts foo.upcase!

separator

puts foo.downcase
puts foo.downcase!

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
