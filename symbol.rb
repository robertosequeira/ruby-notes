require_relative 'helpers'

header('Symbols')

headline('Symbol definition')

# symbols are unique and immutable
p :foo.class         # Symbol
p :foo               # :foo
p :'foo'             # :foo
foo = 'foo'
p :"#{foo}"          # :foo

puts :foo.to_s       # foo
p 'foo'.to_sym       # :foo

separator

puts 'hello'.object_id    # 14970040
puts 'hello'.object_id    # 14969880

p :foo.object_id               # 906908
p :'foo'.object_id             # 906908
foo = 'foo'
p :"#{foo}".object_id          # 906908
p 'foo'.to_sym.object_id       # 906908

