require_relative 'treasure_trove'


class Player
    attr_reader :health
    attr_accessor :name
 
     def initialize(name, health=100) #overwrites the default method when Player.new is created! Default health is now 100.
         @name = name.capitalize
         @health = health
         @found_treasures = Hash.new(0)
     end

     def found_treasure(treasure)
         @found_treasures[treasure.name] += treasure.points
         puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
         puts "#{@name}'s treasures: #{@found_treasures}"
     end
 # POINTS *********************
     def points
      @found_treasures.values.reduce(0, :+)
     end
 # SCORE *********************
     def score
       points + @health
     end 
 
     def name=(new_name)
       @name = new_name.capitalize
     end
 
     def to_s #to_s overwrites/defines the default method for PUTS.
         "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."   
      end
     
      def blam
         @health -= 10
         puts "#{@name} got blammed!"
      end
 
      def w00t
         @health += 15
         puts "#{@name} got w00ted!"
      end

      def strong?
         @health > 100
      end

      def <=>(other) #this overrides default for whenever the compare <=> operator is used on player class object.
         other.score <=> score
      end

      def each_found_treasure
          @found_treasures.each do |name, points|
            yield Treasure.new(name, points)
        end
      end
 end

 if __FILE__ == $0
    player = Player.new("moe")
    puts player.name
    puts player.health
    player.w00t
    puts player.health
    player.blam
    puts player.health
  end