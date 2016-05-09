 $players = []
 $hit_point = []
 $mana_point = []
 $count = 0

 class MainArena


 	def initialize

 	end


 	def mainScreen

 		puts "\n==================================="
 		puts "Welcome to the Battle Arena"
 		puts "-----------------------------------"
 		puts "Description :"
 		puts "1. type 'new' to create a character"
 		puts "2. type 'start' to begin the fight"
 		puts "-----------------------------------"
 		puts "Current Player: #{$players.length}"
 		puts ""
 		for i in 0...$players.length

 			puts "- #{$players[i]} (hp: #{$hit_point[i]}, mp: #{$mana_point[i]})"

 		end

 		puts "\nMax player 2 or 3"
 		puts "-----------------------------------"

 	end

 	def createCharacter

 		new_player = ""

 		print "\nPut Player Name: "
 		new_player = gets.chomp
 		puts "-"
 		puts "Max player 2 or 3"

 		np = Player.new(new_player.to_s)

 		$players.push (np.name)
 		$hit_point.push (np.hp)
 		$mana_point.push (np.mp)
 		
 		$count = $count + 1
 	end

 	def battleStart

 		player_1 = ""
 		player_2 = ""

 		puts "\nBattle Start:"
 		print "Who will attack: "
 		player_1 = gets.chomp
 		print "\nWho attacked: "
 		player_2 = gets.chomp

 		index_1 = $players.index(player_1)
 		index_2 = $players.index(player_2)

 		puts "\nBattle Start:"
 		puts "#{$players[index_1]} ATTACK #{$players[index_2]}"
 		puts "\nDescription:"
 		
 		$mana_point[index_1] = $mana_point[index_1] - 20
 		$hit_point[index_2] = $hit_point[index_2] - 20

 		puts "\nDescription:"
 		puts "#{$players[index_1]}, HP: #{$hit_point[index_1]}, MP: #{$mana_point[index_1]}"
 		puts "#{$players[index_2]}, HP: #{$hit_point[index_2]}, MP: #{$mana_point[index_2]}"


 	end

 end

class Player

	attr_accessor :name, :hp, :mp

	def initialize (name)
		@name = name
		@hp = 40
		@mp = 100
	end

end


player_count = 0
decision = ""


ma = MainArena.new

ma.mainScreen

decision = gets.chomp

while (decision == "new" && $players.length < 3)

	ma.createCharacter
	ma.mainScreen
	decision = gets.chomp

end

while ($hit_point.include?(0) == false)
	ma.battleStart
end


loser_index = $hit_point.index(0)

loser = $players[loser_index]

puts "LOSER: #{loser} !!"

$players.delete_at(loser_index)

puts "CHAMPION: #{$players.to_s} !!"
