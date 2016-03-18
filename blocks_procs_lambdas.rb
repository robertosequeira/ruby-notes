# Reference
# https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/18-blocks/lessons/64-blocks-procs-lambdas
# http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/

# http://ruby-doc.org/core-2.3.0/Proc.html
# http://ruby-doc.org/core-2.2.3/Kernel.html#method-i-proc
# # http://ruby-doc.org/core-2.2.3/Kernel.html#method-i-lambda

#**************************************************************#

names = ['Pedro', 'Mario']

def section(header)
  puts "\n*** #{header} ***\n\n"
end

def sep
  puts "\n"
end

#**************************************************************#

section('Blocks')

def receive_block(elements)
  puts 'Elements received: ' + elements.join(', ')
  yield(elements) if block_given?
end

receive_block(names)

sep

receive_block(names) { |elements| elements.each { |e| puts "- #{e} -" } }

#**************************************************************#

section('Procs')

# Procs are objects

p = Proc.new { |text| puts text }
p.call('Created using Proc.new')
names.each(&p)

sep


p = proc { |text| puts text }
p.call('created using Kernel#proc method')
names.each(&p)

sep

def return_from_proc
  Proc.new { return 'we just returned from the block' }.call
  'we just returned from the calling method'
end

puts return_from_proc     #Prints 'we just returned from the block'

sep

# procs do not validate parameter
p = proc { |text| puts text }
p.call                    #no errors, no print
p.call('hello')           #no errors, prints hello
p.call('hello', 'bye')    #no errors, prints hello and ignores bye

#**************************************************************#

section('Lambdas')

l = lambda { |text| puts text }
l.call('Declared using lambda{}')
names.each(&l)

sep

# Literal - Stabby lambda
l = ->(text){puts text}
l.call('Declared using ->(){}')
names.each(&l)

sep

def return_from_lambda
  lambda { return 'we just returned from the block' }.call
  return 'we just returned from the calling method'
end

puts return_from_lambda       #Prints 'we just returned from the calling method'

sep

l = lambda { |text| puts text }
l.call                        #ArgumentError: wrong number of arguments (0 for 1)
l.call('hello')
l.call('hello', 'welcome')    #ArgumentError: wrong number of arguments (2 for 1)
