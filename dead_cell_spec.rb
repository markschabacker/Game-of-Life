require 'dead_cell'
require 'live_cell'

describe DeadCell do 
  context "stays dead when" do
    0.upto(2) do |n|
      it "has #{n} live neighbors" do
        DeadCell.new.alive_next_iteration?(n).should be_an_instance_of DeadCell
      end
    end

    4.upto(8) do |n|
      it "has #{n} live neighbors" do
        DeadCell.new.alive_next_iteration?(n).should be_an_instance_of DeadCell
      end
    end
  end

  it "comes to life when it has 3 live neighbors" do
    DeadCell.new.alive_next_iteration?(3).should be_an_instance_of LiveCell
  end
end
