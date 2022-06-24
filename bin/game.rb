#!/usr/bin/env ruby
require_relative '../lib/game_class'
require_relative '../lib/clumsy_player_class'
require_relative '../lib/berserk_player_class'

# ************************************** Final Code ***************************************
 #type 'ruby bin/game.rb' to start a game

game = StudioGame::Game.new("Three (Or More) Stooges")
# knuckleheads.load_players("players.csv")
# knuckleheads.load_players(ARGV.shift || "players.csv") 
default_player_file = File.join(File.dirname(__FILE__), 'players.csv')

the_file_option = (ARGV.shift || default_player_file) #extracting the or statement to be its own variable
game.load_players(the_file_option) #subbing in the variable here

if the_file_option == default_player_file # if the variable takes the form of the default file (no user csv file is specified)
    klutz = StudioGame::ClumsyPlayer.new("klutz", 105) #then a clumsy player "Klutz" will be added
    game.add_player(klutz) 

    berserker = StudioGame::BerserkPlayer.new("berserker", 50) #and a berserker player "Klutz" will be added
    game.add_player(berserker) 
else # otherwise (if the user specifies their own csv file, berserker and klutz players will not interfere/be added!!)
end

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

game.save_high_scores #prints high scores to a .txt file