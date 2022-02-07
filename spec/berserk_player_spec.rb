require 'berserk_player_class'

module StudioGame

  describe BerserkPlayer do

    before do
      @ih = 50 #it was at initial_health not ih
      @player = BerserkPlayer.new("berserker", @ih)
    end

    it "does not go berserk when w00ted up to 5 times" do
      1.upto(5) { @player.w00t }

      @player.berserk?.should be_falsey #correct syntax 4 rspec 3.0
    end

    it "goes berserk when w00ted more than 5 times" do
      1.upto(6) { @player.w00t }
      
      @player.berserk?.should be_truthy #correct syntax 4 rspec 3.0
    end

    it "gets w00ted instead of blammed when it's gone berserk" do
      1.upto(6) { @player.w00t } #6 woots
      1.upto(2) { @player.blam } #2 blams

      @player.health.should == @ih + (8 * 15)
    end

  end
end