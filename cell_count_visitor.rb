class CellCountVisitor
  attr_accessor :count

  def initialize
    @count = 0
  end
  
  def increment_count
    @count += 1
  end

  def visit_live_cell(live_cell)
    increment_count
  end
  
  def visit_dead_cell(dead_cell)
    # no-op
  end
end
