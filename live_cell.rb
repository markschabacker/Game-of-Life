require 'dead_cell'

class LiveCell
  def alive_next_iteration?(num_live_neighbors)
    dead_cell = DeadCell.new
    life_truth_table = [dead_cell, 
                        dead_cell, 
                        self, 
                        self, 
                        dead_cell, 
                        dead_cell, 
                        dead_cell, 
                        dead_cell, 
                        dead_cell]
    life_truth_table[num_live_neighbors]
  end
end
