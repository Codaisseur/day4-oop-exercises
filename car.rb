# car.rb

class Car
  attr_accessor :brand, :model, :color, :doors, :lights

  def initialize(brand, model, color, doors, lights = "OFF")
    @brand = brand
    @model = model
    @color = color
    @doors = doors
    @lights = lights
  end

  def switch_lights_on
    @lights = "ON"
  end

  def paint(color)
    @color = color
  end

  def print_self
    puts self
  end

  def print_details
    puts "This car is a #{@brand} #{@model}."
    puts "Its color is #{@color}."
    puts "Its lights are #{@lights}."
    puts "And it has #{@doors} doors."
  end

  def print_details_with_self
    puts "This car is a #{self.brand} #{self.model}."
    puts "Its color is #{self.color}."
    puts "Its lights are #{self.lights}."
    puts "And it has #{self.doors} doors."
  end

  def print_details_without_self
    puts "This car is a #{brand} #{model}."
    puts "Its color is #{color}."
    puts "Its lights are #{lights}."
    puts "And it has #{doors} doors."
  end
end
