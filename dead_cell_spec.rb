require 'dead_cell'

describe DeadCell do 
  context "stays dead when" do
    0.upto(2) do |n|
      it "has #{n} live neighbors" do
        DeadCell.new.alive_next_iteration?(n).should be false
      end
    end

    4.upto(8) do |n|
      it "has #{n} live neighbors" do
        DeadCell.new.alive_next_iteration?(n).should be false
      end
    end
  end

  it "comes to life when it has 3 live neighbors" do
    DeadCell.new.alive_next_iteration?(3).should be true
  end
end
