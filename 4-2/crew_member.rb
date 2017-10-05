# ./crew_member.rb
class CrewMember
  def initialize(name, rank)
    @name = name
    @rank = rank
  end

  def print_credentials
    puts "This is #{rank} #{name}."
  end

  def name
    @name
  end

  def rank
    @rank
  end

  def promote
    @rank = 'Captain'
  end
end
