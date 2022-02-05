require_relative 'berserk_player_class'

describe BerserkPlayer do

  before do
    @initial_health = 50
    @player = BerserkPlayer.new("berserker", @initial_health)
  end

  it "does not go berserk when w00ted up to 5 times" do
    1.upto(5) { @player.w00t }

    @player.berserk?.should be_falsey #correct syntax for rspec 3.0
  end

  it "goes berserk when w00ted more than 5 times" do
    1.upto(6) { @player.w00t }
    
    @player.berserk?.should be_truthy #correct syntax for rspec 3.0
  end

  it "gets w00ted instead of blammed when it's gone berserk" do
    1.upto(6) { @player.w00t } #6 woots
    1.upto(2) { @player.blam } #2 blams

    @player.health.should == @initial_health + (8 * 15)
  end

end