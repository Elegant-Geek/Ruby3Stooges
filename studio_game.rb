# def time
#     t = Time.new
#     t.strftime("%T") #quotes report time as a string value now?
#     #no puts is needed in line 3 because it doesnt need to be printed here, only stored.
# end

# def say_hello(name, health=100)
#     puts "I'm #{name.capitalize} with a health of #{health} as of #{time}."
# end

# name1 = "larry"
# health1 = 60
# name2 = "curly"
# health2 = 125
# name3 = "moe"
# health3 = 100
# name4 = "shemp"
# health4 = 90

# say_hello(name1, health1)
# say_hello(name2, health2)
# say_hello(name3, health3)
# say_hello(name4, health4)

#****************************************NEW CODE*************************************************
class Player
   attr_reader :health
   attr_accessor :name

   
    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end

    def score
      @name.length + @health
    end 
#lines 42 - 44 override the "setter" default that we created using the attribute "accessor"
# 42-44 explicitly makes it so that whenever you rewrite/revise (setter) a 
# game player's name, it is automatically capitalized, even if you defined it as lowercase
    def name=(new_name)
      @name = new_name.capitalize
    end

    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
     end
    
     def blam
        @health -= 10
        puts "#{@name} got blammed!"
     end

     def w00t
        @health += 15
        puts "#{@name} got w00ted!"
     end
end

player1 = Player.new("moe", 100)
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

puts player1
puts player2
puts player3

player3.blam
puts player3
player3.w00t
puts player3

puts player1.health
puts player2.health
puts player3.health

player2.name = "lawrence" #even when you assign a lowercase name,
                          #we set this renamed string to be capitalized in line 43!
puts player2.name 
puts player2              #this line prints out, and shows that lawrence is now capitalized! 

#************************ ARRAYS SECTION ***********************
players = [player1, player2, player3]

puts "There are #{players.size} players in the game:"

players.each do |player|
   puts player.health
end

players.each do |player|
   puts player #prints status before woots/blams
   player.blam
   player.blam
   player.w00t
   player.w00t
   puts player #prints status after woots/blams
end
#players.push(player3) <<<< oops this was just an accident. ignore this line

players.pop #removes curly
player4 = Player.new("shemp", 90) #adds shemp
players.push(player4) #puts shemp into the array

puts players