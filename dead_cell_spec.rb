require 'dead_cell'
require 'live_cell'
require 'cell_count_visitor'

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

  it "does not increment a CellCountVisitor" do
    visitor = CellCountVisitor.new
    dead_cell = DeadCell.new

    visitor.visit_cell(dead_cell)
    visitor.count.should == 0
  end

  [1, 10, 1000].each do |n|
    it "does not increment a CellCountVisitor initialized to #{n}" do
      visitor = CellCountVisitor.new
      visitor.count = n
      dead_cell = DeadCell.new

      visitor.visit_cell(dead_cell)
      visitor.count.should == n
    end
  end
end
