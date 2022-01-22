# # puts "Welcome!"
# greeting = "Welcome!"
# 3.times do
#     puts greeting.upcase #so its the equivalent of saying console.log (display) the variable greeting in all uppercase!
# end
# puts Time.now

#************************************** concatenation ('') version ******************************************
# name1 = 'larry'
# health1 = 60
# puts name1 + '\'s health is ' + health1.to_s #concatenation sucks

#************************************** interpolation ("") version ******************************************
# name1 = "larry"
# health1 = 60
# puts "#{name1.capitalize}'s health is #{health1}" #same thing, just done with interpolation syntax

# # puts "Players: \n\t larry \n\t curly \n\t moe" # Creating an indented list within one double quoted string of text!!!!! (using \n and \t)

# name2 = "curly"
# name3 = "moe"

# puts "Players: \n\t #{name1} \n\t #{name2} \n\t #{name3}" # using variable assigned names instead

#************************************** exercise for part 4 ******************************************

name1 = "larry"
health1 = 60
puts "#{name1.capitalize} has a health of #{health1}." 

name2 = "curly"
health2 = 125
puts "#{name2.upcase} has a health of #{health2}." 


health2 = health1 #mirroring curlys health to larrys health
puts "\n#{name2.upcase} has a health of #{health2}."    #I used \n to create a line break. This line shows that curly's health mirrors health1 now 

health1 = 30
puts "\n#{name1.capitalize} has a health of #{health1}." 
puts "#{name2.upcase} has a health of #{health2}."      

# ^^ the above returns 
                        #Larry has a health of 30.
                        #CURLY has a health of 60.
#which means that once a variable is redefined as a different string or number, the mirroring effect is BROKEN! 

name3 = "moe"
health3 = 100

puts "#{name3} has a health of #{health3}."

puts "#{name3.capitalize} has a health of #{health3}.".center(50, '*') #adding the center method at the end and the .capitalize on to the name3 variable


name4 = "shemp"
health4 = 90

puts "#{name4.capitalize}".ljust(30, '.') + " #{health4} health" 
#my answer (mine looks sloppy but theirs makes sense)

puts "#{name4.capitalize.ljust(30, '.')} #{health4} health" 
#their answer: they just put the ljust method inside the name variable


puts 123.to_s.reverse #printing out the number 321 as a string with its characters reversed
puts 123.to_s.reverse.to_i #ditto but then converting it back to an integer after! (it will still print this)

current_time = Time.new
puts current_time.strftime("The game started on %A %D at %I:%M%p.") 
#note: no space between %M and %p to display 5:15PM