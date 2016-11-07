require_relative 'helpers'

# https://ruby-doc.org/core-2.3.1/Comparable.html

header('Comparable')

class Developer
  include Comparable
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def <=>(other)
    self.age <=> other.age
  end

end

fredo = Developer.new('Fredo', 24)
cris = Developer.new('Cris', 25)
karla = Developer.new('Karla', 26)
esteban = Developer.new('Esteban', 27)
roberto = Developer.new('Roberto', 20)

headline('Comparison')

puts fredo < cris         # true
puts cris <= karla        # true
puts karla == esteban     # false
puts esteban >= roberto   # true
puts roberto > fredo      # false

separator

puts fredo.between?(roberto, esteban)   # true
puts fredo.between?(cris, esteban)      # false

headline('Sorting')

p [esteban, roberto, cris, karla, fredo].sort.map(&:name) # ["Roberto", "Fredo", "Cris", "Karla", "Esteban"]
