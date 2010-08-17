require 'cell_count_visitor'

describe CellCountVisitor do
  it "initializes with a count of 0" do
     CellCountVisitor.new.count.should == 0
  end
  
  it "has a count of 1 when incremented once" do
    cell_count_visitor = CellCountVisitor.new
    cell_count_visitor.increment_count
    cell_count_visitor.count.should == 1
  end

  it "has a count of 2 when incremented twice" do
    cell_count_visitor = CellCountVisitor.new
    cell_count_visitor.increment_count
    cell_count_visitor.increment_count
    cell_count_visitor.count.should == 2
  end
  
  0.upto(10).each do |n|
    it "has a count of #{n} when incremented #{n} times" do
      cell_count_visitor = CellCountVisitor.new
      (1..n).each do
        cell_count_visitor.increment_count
      end
      cell_count_visitor.count.should == n
    end
  end
  
  it "increments its count when visiting a live cell" do
    cell_count_visitor = CellCountVisitor.new
    cell_count_visitor.visit_live_cell(LiveCell.new)
    cell_count_visitor.count.should == 1
  end

  it "does not increment its count when visiting a dead cell" do
    cell_count_visitor = CellCountVisitor.new
    cell_count_visitor.visit_dead_cell(DeadCell.new)
    cell_count_visitor.count.should == 0
  end
end
