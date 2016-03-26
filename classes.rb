require_relative 'helpers'

header('Classes')

class Spaceship
  def initialize
    @creation_date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

  def launch(destination)
    @destination = destination
  end
end

headline('Inspect element')

s = Spaceship.new
s.launch('Earth')
puts s.inspect    #<Spaceship:0x000000016972a0 @creation_date="26/03/2016 13:35:21", @destination="Earth">
p s
