# ./crew_member.rb
class CrewMember
  def initialize(name, rank)
    @name = name
    @rank = rank
  end

  def print_details
      puts "This is #{rank} #{name}."
  end

  def promote
    return if is_captain?
    puts "Promoting #{self.name} to Captain."
    @rank = 'Captain'
  end

  def name
    @name
  end

  def rank
    @rank
  end

  def is_captain?
    rank.downcase == 'captain'
  end
end
