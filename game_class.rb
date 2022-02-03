# ****************** GAME CLASS ******************
require_relative 'player_class'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
class Game
    attr_reader :title

    def initialize(title)
        @title = title
        @players = []
    end

    def add_player(a_player)
        @players.push(a_player)   #use @players since @players refers to the array u created in the initialize method
    end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end

    def play(rounds)
      puts "There are #{@players.size} players in #{@title}: "
      
      @players.each do |player|
        puts player
      end

      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"

      treasures.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points."
      end


      1.upto(rounds) do |round|
        puts "\nRound #{round}:"
        @players.each do |player|
          GameTurn.take_turn(player) 
          puts player
        end
      end 
    end

    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end

    def print_stats
      strong_players, wimpy_players = @players.partition { |player| player.strong? }
    
    puts "\n#{title} Statistics:"
    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end
  
    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      print_name_and_health(player)
    end

    sorted_players = @players.sort{ |a, b| b.score <=> a.score}
    puts "\n#{title} High Scores:"
    sorted_players.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found."

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end



  end
end