require_relative '../lib/game_class'
require_relative '../lib/clumsy_player_class'
require_relative '../lib/berserk_player_class'

# ************************************** THE CODE THAT IS GETTING RUN ***************************************
 #type 'ruby bin/game.rb' to start a game

game = StudioGame::Game.new("Knuckleheads")
# knuckleheads.load_players("players.csv")
# knuckleheads.load_players(ARGV.shift || "players.csv") 
default_player_file = File.join(File.dirname(__FILE__), 'players.csv')
game.load_players(ARGV.shift || default_player_file)


klutz = StudioGame::ClumsyPlayer.new("klutz", 105) #altered 11th commit
game.add_player(klutz) #altered 11th commit

berserker = StudioGame::BerserkPlayer.new("berserker", 50) #altered 11th commit
game.add_player(berserker) #altered 11th commit

loop do
    puts "\nHow many rounds? (Type 'quit' or 'exit' to end the game.)"
    answer = gets.chomp.downcase #gets takes user input from cmd (must run from cmd now). chomp removes line break caused by ENTER key.
    case answer
    when /^\d+$/
        game.play(answer.to_i) #the line that starts the game (altered 11th commit)
    when 'quit', 'exit', 'stop'
        game.print_stats #the line that prints the stats (altered 11th commit)
        break
    else 
        puts "Please enter a number or type 'quit' to end the game."
    end
end

game.save_high_scores