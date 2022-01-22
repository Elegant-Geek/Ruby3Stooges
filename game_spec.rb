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
    @game.play
    @player.health.should == (@ih + 15)
  end

  it "skip for mid die roll" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play
    @player.health.should == @ih
  end
  
  it "blams for low die roll" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play
    @player.health.should == @ih - 10
  end

end
