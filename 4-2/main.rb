# ./main.rb
require_relative 'crew_member'

chewie = CrewMember.new('Chewbacca', 'First Mate')

chewie.print_credentials

chewie.promote
chewie.print_credentials
