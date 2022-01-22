require_relative 'player_class'
require_relative 'spec_helper'



describe Player do
    before do
        @ih = 150
        @player = Player.new("larry", @ih)
      end
  # examples go here
    it "has a capitalized name" do

        @player.name.should == "Larry"
    end

    it "has an initial health" do 

        @player.health.should == 150
    end

    it "has a string representation" do

        @player.to_s.should == "I'm Larry with a health of 150 and a score of 155." #dont forget those double equal signs! and "SHOULD"
    end

    it "computes a score as the sum of its health and length of name" do

        @player.score.should == (155)
    end

    it "increases health by 15 when w00ted" do
        @ih = 150
        @player.w00t

        @player.health.should == (@ih + 15)
    end


    it "decreases health by 10 when blammed" do
        @ih = 150
        @player.blam

        @player.health.should == (@ih - 10)
    end

    context "with health greater than 100" do
        before do
            @player = Player.new("larry", 150)
          end
        it "is strong" do
            @player.should be_strong 
        end
    end
    context "with health less than / equal to 100" do
        before do
            @player = Player.new("larry", 100)
          end
        it "is wimpy" do
            @player.should_not be_strong 
        end
    end

    context "in a collection of players" do
        before do
          @player1 = Player.new("moe", 100)
          @player2 = Player.new("larry", 200)
          @player3 = Player.new("curly", 300)
      
          @players = [@player1, @player2, @player3]
        end
      
        it "is sorted by decreasing score" do
          @players.sort.should == [@player3, @player2, @player1]
        end
      end
end


# expect(player.name).to eq("Larry") <<<<<< the new expectation line syntax






