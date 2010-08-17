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

  it "tells a visitor to visit a dead cell" do
    mock_visitor = Object.new
    dead_cell = DeadCell.new
    mock_visitor.should_receive(:visit_dead_cell).with(dead_cell)

    dead_cell.accept_visitor(mock_visitor)
  end
end
