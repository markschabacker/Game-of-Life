require 'cell_coordinates'
require 'coordinates'
require 'live_cell'
require 'dead_cell'

class Game
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def evolve
    evolved_cells = []
    @cells.each do |cell|
      evolved_cells << CellCoordinates.new(cell.cell.alive_next_iteration?(0), cell.coordinates)
    end
    @cells = evolved_cells
  end
end
