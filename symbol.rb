require_relative 'helpers'

header('Symbols')

headline('Symbol definition')
# symbols are unique and inmutable
puts :foo.class         # Symbol
puts :foo               # foo
puts :'foo'
foo = 'foo'
puts :"#{foo}"

puts :foo.to_s
puts 'foo'.to_sym




