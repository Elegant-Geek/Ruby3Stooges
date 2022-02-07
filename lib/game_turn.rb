# ****************** MODULE GAMETURN ************************
require_relative 'player_class'
require_relative 'die'
require_relative 'treasure_trove'
require_relative 'loaded_die'

module StudioGame
  module GameTurn
      def self.take_turn(player) 
          die = Die.new #replace Die with LoadedDie to see the loaded die exposed by its class! (since audit was implemented in the roll method)
            case die.roll
            when 1..2
              player.blam
            when 3..4
              puts "#{player.name} was skipped."
            else
              player.w00t
            end
            treasure = TreasureTrove.random
            player.found_treasure(treasure)
            # puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
      end

      # def self.take_turn(player)
      #   # code to roll die and w00t or blam
      
      #   treasure = TreasureTrove.random
      #   player.found_treasure(treasure)
      # end
      
  end
end