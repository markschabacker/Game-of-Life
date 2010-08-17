class CellCoordinates
  attr_reader :cell, :coordinates

  def initialize(cell, coordinates)
    @cell = cell
    @coordinates = coordinates
  end  
end
