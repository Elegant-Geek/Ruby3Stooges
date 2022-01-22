puts "Jamie's favorite movie is 9" # single apostrophe ' is ok inside double quotes ""
puts 'Jamie\'s favorite movie is 9' # use the '\s inside single quotes to get same effect

# forming a sentence with multiple variables and strings

movie = 'Goonies'
puts 'Mike\'s favorite movie is ' + movie # put a space after is ' then apostrophe

rank = 10
puts movie + ' has a rank of ' + rank.to_s #to.s converts integers/numbers into strings! Like ${} in JS

