require_relative 'auditable'

class Die
    include Auditable
    attr_reader :number #makes die remember the number it rolled

    def roll
        @number = rand(1..6)
        audit
        @number #Lastly, return the @number value as the last expression in the method since the game expects roll to return a number.
    end

end

#my own code showing that the die contains a readable attribute, its number!
#all you have to do is tack on ".number" for the number of the die to come up.
#note that the number attribute is stored in / sourced from the @number instance variable.

if __FILE__ == $0
    die = Die.new()
    die.roll # displays "Rolled a # (Die)" because ROLL calls the audit as defined within the roll method
             # note that this die.roll is also testing that the audit method (mixin) from the Auditable module works.
    puts "\nThis is the number: #{die.number}" #with the die object, you can call the readable number attribute with .number
    puts "This is the class: #{die.class}" #with the die object, you can call the object class with .class
  end