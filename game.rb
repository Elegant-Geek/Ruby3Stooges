#**************************************** CODE FROM PART 11 NOW... *************************************************
#  player1 = Player.new("moe", 100)
#  player2 = Player.new("larry", 60)
#  player3 = Player.new("curly", 125)
 
#  puts player1
#  puts player2
#  puts player3
 
#  player3.blam
#  puts player3
#  player3.w00t
#  puts player3
 
#  puts player1.health
#  puts player2.health
#  puts player3.health

# ************************************** GRABBING/GATHERING OUTSIDE CLASSES ***************************************
require_relative 'game_class'
require_relative 'player_class'


# ************************************** THE CODE THAT IS GETTING RUN ***************************************
player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

knuckleheads.play           #this is the line that actually starts the game

# ************************************** BONUS CODE TO RUN ***************************************

# player4 = Player.new("Alvin", 100)
# player5 = Player.new("Simon", 60)
# player6 = Player.new("Theo", 125)

# chipmunks = Game.new("Chipmunks")
# chipmunks.add_player(player4)
# chipmunks.add_player(player5)
# chipmunks.add_player(player6)
# chipmunks.play

