class CellCountVisitor
  attr_accessor :count

  def initialize
    @count = 0
  end
  
  def increment_count
    @count += 1
  end

  def visit_cell(cell)
    cell.accept_visitor(self)
  end
end
