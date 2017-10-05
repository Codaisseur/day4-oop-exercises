# ./main.rb
require_relative 'space_ship'
require_relative 'crew_member'

eagle_five = SpaceShip.new('Eagle 5', 'white')
x_wing = SpaceShip.new('X-Wing', 'orange')

lone_star = CrewMember.new('Lone Star', 'Captain')
barf = CrewMember.new('Barf', 'First Mate')
luke = CrewMember.new('Luke Skywalker', 'Captain')
r2d2 = CrewMember.new('R2-D2', 'Droid')

eagle_five.print_details
x_wing.print_details

puts '*' * 3
x_wing.add_crew(luke)
x_wing.add_crew(r2d2)
x_wing.print_details

puts '*' * 3
eagle_five.add_crew(lone_star)
eagle_five.add_crew(barf)
eagle_five.print_details
