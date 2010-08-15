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
  
  it "can visit cells" do
    cell_count_visitor = CellCountVisitor.new

    mock_cell = Object.new
    mock_cell.should_receive(:accept_visitor).with(cell_count_visitor);

    cell_count_visitor.visit_cell(mock_cell) 
  end
end
