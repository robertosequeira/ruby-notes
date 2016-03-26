require_relative 'helpers'

header('Objects')

headline('Everything is a object')

puts 1.is_a?(Object)          #true
puts 1.5.is_a?(Object)        #true
puts "string".is_a?(Object)   #true
puts nil.is_a?(Object)        #true
puts Object.is_a?(Object)     #true

headline('Superclass')

# BasicObject is the base class for all elements
puts String.superclass                                    #Object
puts String.superclass.superclass                         #BasicObject
puts Integer.superclass                                   #Numeric
puts Integer.superclass.superclass                        #Object
puts Integer.superclass.superclass.superclass             #BasicObject
puts Integer.superclass.superclass.superclass.superclass  #nil

headline('Both variable refer to the same element')

a = 'abc'
b = a
a.upcase!
puts a
puts b
puts a.object_id
puts b.object_id

headline('Now variables refer to different objects')

b = a.clone
puts a
puts b
puts a.object_id
puts b.object_id
