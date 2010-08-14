require 'live_cell'

describe LiveCell do

  context "dies when" do
    it "has 0 live neighbors" do
      LiveCell.new.alive_next_iteration?(0).should be false
    end
    
    it "has 1 live neighbors" do
      LiveCell.new.alive_next_iteration?(1).should be false
    end

    4.upto(8) do |n|
      it "has #{n} live neighbors" do
        LiveCell.new.alive_next_iteration?(n).should be false
      end
    end
  end

  context "lives when" do
    it "has 2 live neighbots" do
      LiveCell.new.alive_next_iteration?(2).should be true
    end

    it "has 3 live neighbors" do
      LiveCell.new.alive_next_iteration?(3).should be true
    end
  end
end
