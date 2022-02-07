module Playable #needs to write to health and read name
    def blam
        self.health -= 10           # the .self is REQUIRED on writable attributes (health)
        puts "#{name} got blammed!" # the .self is optional on readable attributes (name)
     end

     def w00t
        self.health += 15
        puts "#{name} got w00ted!"
     end

     def strong?
        health > 100
     end
end