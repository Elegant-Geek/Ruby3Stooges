************************************** BASIC INSTRUCTIONS **************************************
TO RUN DEFAULT CSV SHEET PLAYERS:
ruby bin/game.rb

TO RUN A CUSTOM CSV FILE:
You can also drop your own game csv file with the name and health of players.
Drop your csv sheet in the bin file and specify it like this:
ruby bin/game.rb bin/yourfile.csv
Try running ruby bin/game.rb bin/sideshow.csv

All of this can be done from the studio_game directory.
1)	Run rspec (then hit enter) in cmd and have all 31 tests pass!
2)	Use cmd line to start new game with default file:     ruby bin/game.rb 
3)	Specify the number of rounds using an integer value or type “quit” or “exit” to leave.
4)	You can view the exported high score sheet, “high_scores.txt” (which overwrites every time you run the game).
5)	Coding note: the game name can be changed on line 8:
    game = StudioGame::Game.new("GAME NAME HERE") for example.
    currently the name is set to "Three (Or More) Stooges"
6)	Example code to build a gem with this project: 
    gem build studio_game.gemspec
    gem install studio_game-1.0.0.gem
    gem list 					                    (verify installation)
    gem list studio_game -d 			            (gem details)
    ruby bin/game.rb 				                (running the game)
    gem uninstall studio_game-1.0.0.gem
