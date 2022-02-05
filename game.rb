# ************************************** GRABBING/GATHERING OUTSIDE CLASSES ***************************************
require_relative 'game_class'
require_relative 'player_class'
require_relative 'treasure_trove'
require_relative 'clumsy_player_class'
require_relative 'berserk_player_class'
require_relative 'berserk_player_class'

# ************************************** THE CODE THAT IS GETTING RUN ***************************************
knuckleheads = Game.new("Knuckleheads")
# knuckleheads.load_players("players.csv")
knuckleheads.load_players(ARGV.shift || "players.csv") 

klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

berserker = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
    puts "\nHow many rounds? (Type 'quit' or 'exit' to end the game.)"
    answer = gets.chomp.downcase #gets takes user input from cmd (must run from cmd now). chomp removes line break caused by ENTER key.
    case answer
    when /^\d+$/
        knuckleheads.play(answer.to_i) #the line that starts the game
    when 'quit', 'exit', 'stop'
        knuckleheads.print_stats #the line that prints the stats
        break
    else 
        puts "Please enter a number or type 'quit' to end the game."
    end
end

knuckleheads.save_high_scores