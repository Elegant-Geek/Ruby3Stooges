require_relative 'player_class'

class BerserkPlayer < Player
    def initialize(name, health=100) #overwrites the default method when Player.new is created! Default health is now 100.
        super(name, health)
        @w00t_count = 0
    end

    def berserk? 
        @w00t_count > 5
    end 

    def w00t
        super #kind of like "apply all" here where super calls and applies the whole regular Player w00t method.
        @w00t_count +=1 #additional w00t method instructions specific to berserker subclass.
        puts "#{@name} is berserk!" if berserk? #fancy if statement (prints a warning when statement is true!)
    end

    def blam
        berserk? ? w00t : super #ternary operator rocks. woot if berserk is true, super if false
    end

end
    # let's get some visible output on how a BerserkPlayer behaves at this point
    # if __FILE__ == $0
    #     berserker = BerserkPlayer.new("berserker", 50)
    #     6.times { berserker.w00t }
    # end

    if __FILE__ == $0
        berserker = BerserkPlayer.new("berserker", 50)
        6.times { berserker.w00t }
        2.times { berserker.blam }
        puts berserker.health
    end
