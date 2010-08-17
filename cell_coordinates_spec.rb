require 'cell_coordinates'

describe CellCoordinates do
  it "is initialized with a (cell/coordinate) pair" do
    cell = Object.new
    coordinates = Object.new
    cell_coordinates = CellCoordinates.new(cell, coordinates)
    cell_coordinates.cell.should == cell
    cell_coordinates.coordinates.should == coordinates
  end
end
