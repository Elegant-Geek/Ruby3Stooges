require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @ih = 100 # literally my only mistake lmao
    @player = Player.new("moe", @ih)

    @game.add_player(@player)
  end

  it "w00t for high die roll" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(2)
    @player.health.should == @ih + (15 * 2)
  end

  it "skip for mid die roll" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play(2)
    @player.health.should == @ih
  end
  
  it "blams for low die roll" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play(2)
    @player.health.should == (@ih - 10 * 2)
  end
  
  it "assigns a treasure for points during a player's turn" do
    game = Game.new("Knuckleheads")
    player = Player.new("moe")
  
    game.add_player(player)
  
    game.play(1)
  
    player.points.should_not be_zero
  
    # or use alternate expectation syntax:
    # expect(player.points).not_to be_zero
  end

  it "computes total points as the sum of all player points" do
    game = Game.new("Knuckleheads")
  
    player1 = Player.new("moe")
    player2 = Player.new("larry")
  
    game.add_player(player1)
    game.add_player(player2)
  
    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))
  
    game.total_points.should == 500
  end

end
