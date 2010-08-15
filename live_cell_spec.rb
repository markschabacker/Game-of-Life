require 'live_cell'
require 'dead_cell'

describe LiveCell do

  context "dies when" do
    it "has 0 live neighbors" do
      LiveCell.new.alive_next_iteration?(0).should == DeadCell.instance
    end
    
    it "has 1 live neighbors" do
      LiveCell.new.alive_next_iteration?(1).should == DeadCell.instance 
    end

    4.upto(8) do |n|
      it "has #{n} live neighbors" do
        LiveCell.new.alive_next_iteration?(n).should == DeadCell.instance
      end
    end
  end

  context "lives when" do
    it "has 2 live neighbors" do
      LiveCell.new.alive_next_iteration?(2).should == LiveCell.instance 
    end

    it "has 3 live neighbors" do
      LiveCell.new.alive_next_iteration?(3).should == LiveCell.instance 
    end
  end

  it "returns the same value every time instance is called" do
    instance = LiveCell.instance
    instance.nil?.should == false
    LiveCell.instance.should == instance
  end
end
