require_relative 'helpers'


header('Constants')

headline('Constant declaration')

# ll uppercase
MAX_SPEED = 85

puts MAX_SPEED                          # 85

separator

class MyClass
  MIN_SPEED = 25
end

puts MIN_SPEED rescue puts $!.message   # uninitialized constant MIN_SPEED
puts MyClass::MIN_SPEED                 # 25

MyClass::MAX_SPEED = 60
puts MyClass::MAX_SPEED                 # 60
