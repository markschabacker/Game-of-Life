require 'live_cell'

class DeadCell
  def alive_next_iteration?(num_live_neighbors)
    life_truth_table = [self, 
                        self, 
                        self, 
                        LiveCell.new, 
                        self, 
                        self, 
                        self, 
                        self, 
                        self]
    life_truth_table[num_live_neighbors]
  end
  def accept_visitor(visitor)
    #no-op
  end
end
