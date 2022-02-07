# ********** LOADED DIE ******************
require_relative 'auditable'

class LoadedDie
    include Auditable
    attr_reader :number
  
    def roll
      numbers = [1, 1, 2, 5, 6, 6]
      @number = numbers.sample
      audit # audit allows for the loaded die class (loaded die) to be exposed during gameplay
      @number # Lastly, return the @number value as the last expression in the method since the game expects roll to return a number.
    end
  end

  if __FILE__ == $0
    die = LoadedDie.new()
    die.roll # displays "Rolled a # (Die)" because ROLL calls the audit as defined within the roll method
             # note that this die.roll is also testing that the audit method (mixin) from the Auditable module works.
    puts "\nThis is the number: #{die.number}" #with the die object, you can call the readable number attribute with .number
    puts "This is the class: #{die.class}" #with the die object, you can call the object class with .class
  end