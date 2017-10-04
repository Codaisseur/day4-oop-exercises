# ./main.rb
require_relative 'space_ship'

ship = SpaceShip.new('Millenium Falcon', 'gray')

ship.print_details

ship.paint('rainbow')

ship.print_details
