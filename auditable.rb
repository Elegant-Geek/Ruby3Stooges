module Auditable
    def audit
        puts "Rolled a #{self.number} (#{self.class})" # the number attribute references its class and own readable attribute name called number
    end
end