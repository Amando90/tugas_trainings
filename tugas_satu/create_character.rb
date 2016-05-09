

class CreateCharacter

	player_new = Array.new()

	def initialize

	end

	def show_session
		require_relative 'player'

		puts ""
 		puts ""
 		puts "=================================="
 		puts "Welcome to the Battle Arena"
 		puts "=================================="
 		puts "Description: "
 		puts "1. type 'new' to create character"
 		puts "2. type 'start' to begin the fight"
 		puts "----------------------------------"
 		puts "Put Player Name: "

 		player_name =  gets.chomp

 		puts "Max player 2 or 3"
 		puts "=================================="

 		player_new << Player.new(player_name)


 	end

end