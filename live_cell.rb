class LiveCell
  def alive_next_iteration?(num_live_neighbors)
    life_truth_table = [false, false, true, true, false, false, false, false, false]
    life_truth_table[num_live_neighbors]
  end
end
