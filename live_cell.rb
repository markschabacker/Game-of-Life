require 'dead_cell'

class LiveCell
  @@instance = LiveCell.new

  def alive_next_iteration?(num_live_neighbors)
    life_truth_table = [DeadCell.instance,
                        DeadCell.instance, 
                        LiveCell.instance,
                        LiveCell.instance,
                        DeadCell.instance, 
                        DeadCell.instance, 
                        DeadCell.instance, 
                        DeadCell.instance, 
                        DeadCell.instance]
    life_truth_table[num_live_neighbors]
  end  

  def self.instance
    @@instance
  end
end
