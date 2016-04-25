require_relative 'helpers'

header('Kernel module')

headline('')

p Array(1..3)                           # [1, 2, 3]
p Hash(a: 'a', b: 'b')                  # {:a=>"a", :b=>"b"}

puts block_given?                       # false

separator

# [:$;, :$-F, :$@, :$!, :$SAFE, :$~, :$&, :$`, :$', :$+, :$=, :$KCODE, :$-K, :$,, :$/, :$-0, :$\, :$_, :$stdin,
# :$stdout, :$stderr, :$>, :$<, :$., :$FILENAME, :$-i, :$*, :$?, :$$, :$:, :$-I, :$LOAD_PATH, :$",
# :$LOADED_FEATURES, :$VERBOSE, :$-v, :$-w, :$-W, :$DEBUG, :$-d, :$0, :$PROGRAM_NAME, :$-p, :$-l, :$-a,
# :$1, :$2, :$3, :$4, :$5, :$6, :$7, :$8, :$9]
p global_variables

separator

p lambda {|i| puts i}

separator

a = 1
loop do
  puts "Line: #{a}"
  a += 1
  break if a == 3
end

separator

open('files/file.txt') do |file|
  puts file.read
end

separator

p proc {|i| puts i}
