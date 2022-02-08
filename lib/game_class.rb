# ****************** GAME CLASS ******************
require_relative 'player_class'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

module StudioGame
  class Game
      attr_reader :title

      def initialize(title)
          @title = title
          @players = []
      end

      # def load_players(from_file)
      #   File.readlines(from_file).each do |line|
      #     name, health = line.split(',')
      #     player = Player.new(name, Integer(health))
      #     add_player(player)
      #   end
      # end

      # *** easier approach than the solution above using Ruby's CSV library (MUST use require 'csv' at the top) ***
      def load_players(from_file)
        CSV.foreach(from_file) do |row|
          player = Player.new(row[0], row[1].to_i)  # immediately sends row[0] and row[1] values to local variables name and health (line 8 of player_class.rb)
          add_player(player) # adds to the player array (stored in local variable @players)
        end
      end

      def high_score_entry(player)
        formatted_name = player.name.ljust(20, '.')
        "#{formatted_name} #{player.score}"
      end

      def save_high_scores(to_file="high_scores.txt")
        File.open(to_file, "w") do |file|
          file.puts Time.new.strftime("File updated/created on %m/%d/%Y at %I:%M %p.") #me printing the time!
          file.puts "\n#{@title} High Scores:"
          @players.sort.each do |player|
            file.puts high_score_entry(player)
          end
        end
      end

      def add_player(a_player)
          @players.push(a_player)   #use @players since @players refers to the array u created in the initialize method
      end

      def total_points
        @players.reduce(0) { |sum, player| sum + player.points }
      end

      def play(rounds)
        puts "There are #{@players.size} players in the game '#{@title}': " 
        
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
        puts high_score_entry(player)
      end
      puts "\n(High scores have been saved to 'high_scores.txt')"

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
end