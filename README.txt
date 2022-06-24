BASIC INSTRUCTIONS 

INSTALLATION EXAMPLE (For older version of 1.0.1):
gem install jamies_studio_game-1.0.1.gem

TO RUN DEFAULT CSV SHEET PLAYERS:
ruby bin/game.rb

TO RUN A CUSTOM CSV FILE:
You can also drop your own game csv file with the name and health of players.
Have a csv file in your current directory. 
FORMATTING
Column 1 for names and column 2 initial health values (integers only)

Call your own CSV file from cmd line like this:
ruby bin/game.rb yourfile.csv
Try running ruby bin/game.rb bin/sideshow.csv
