# main.rb

require_relative 'car'

my_car = Car.new("Citroen", "Xara", "blue", 5, "OFF")

# self
puts "➜ my_car.print_self \t gives us the Car instance we have stored as my_car"
my_car.print_self
puts

# local variable
puts "➜ puts my_car         \t gives us the Car instance we have stored as my_car"
puts my_car
puts

# instance variable
puts "➜ my_car.print_details \t gives us the information on the Car instance we have stored as my_car"
my_car.print_details
puts

# self.attribute
puts "➜ my_car.print_details_with_self\t gives us the information on the Car instance we have stored as my_car"
my_car.print_details_with_self
puts

# without self
puts "➜ my_car.print_details_without_self \t gives us the information on the Car instance we have stored as my_car"
my_car.print_details_without_self
