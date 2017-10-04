# ./space_ship.rb
class SpaceShip
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
    @crew_members = []
  end

  def print_details
    if @crew_members.length.zero?
      puts "The #{name} is #{color} and currently has no crew."
    else
      puts "The #{name} is #{color} and currently has a crew of: #{print_crew}."
    end
  end

  def print_crew
    crew_names = @crew_members.map { |crew| crew.name }
  end

  def add_crew(crew_member)
    puts "Adding #{crew_member.name} to #{self.name}."

    @crew_members << crew_member
  end
end
