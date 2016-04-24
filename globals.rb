require_relative 'helpers'

header('Globals')

headline('Exceptions')

begin
  3/0
rescue
  p $!
  p $@
end

headline('regular')
