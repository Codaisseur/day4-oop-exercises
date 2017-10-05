# ./space_ship.rb
class SpaceShip
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def print_details
    puts "That ship is the #{name}!  I can tell by the #{color} color."
  end

  def paint(new_color)
    self.color = new_color
  end
end
