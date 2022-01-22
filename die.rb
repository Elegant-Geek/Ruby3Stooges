class Die
    attr_reader :number #makes die remember the number it rolled
    def initialize   # this is a method that calls roll which sets @number
        roll           #die rolls itself upon creation
    end

    def roll
        @number = rand(1..6)
    end

end

