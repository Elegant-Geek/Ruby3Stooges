require_relative 'player_class'

module StudioGame
  class ClumsyPlayer < Player
      def found_treasure(treasure)
          # points = treasure.points / 2.0 #the only difference that makes someone clumsy is that they get half the points
          # @found_treasures[treasure.name] += treasure.points
          # puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."

          damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0) #critical that this yields a floating point result/value! 
          super(damaged_treasure)
        end
  end 

  # let's get some visible output on how a ClumsyPlayer behaves at this point.
  if __FILE__ == $0
      clumsy = ClumsyPlayer.new("klutz")
    
      hammer = Treasure.new(:hammer, 50)
      clumsy.found_treasure(hammer)
      clumsy.found_treasure(hammer)
      clumsy.found_treasure(hammer)
    
      crowbar = Treasure.new(:crowbar, 400)
      clumsy.found_treasure(crowbar)
    
      clumsy.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{clumsy.points} grand total points"
    end
  end