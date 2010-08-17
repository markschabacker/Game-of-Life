require 'game'
require 'coordinates'
require 'dead_cell'
require 'live_cell'
require 'cell_coordinates'

describe Game do
  context "can be initialized with a collection of cell coordinates" do
    it "with size 0" do
      game = Game.new([])
      game.should have(0).cells
    end
    
    it "with size 1" do
      cell0 = Object.new
      game = Game.new([cell0])
      game.should have(1).cells
      game.cells.should include(cell0)
    end
    
    [2,5,10,20,100,500].each do |n|
      it "with size #{n}" do
        added_cells = []
        (1..n).each do |i|
          added_cells << Object.new
        end

        game = Game.new(added_cells)
        game.should have(n).cells
        added_cells.each do |cell|
          game.cells.should include(cell)
        end
      end
    end
  end

  context "can evolve itself such that" do
    it "an empty board stays empty" do
      game = Game.new([])
      game.evolve
      game.should have(0).cells
    end
    
    it "a single dead cell stays dead" do
      dead_cell = CellCoordinates.new(DeadCell.new, Coordinates.new)
      game = Game.new([dead_cell])
      game.evolve
      game.should have(1).cells
      game.cells[0].coordinates.should == dead_cell.coordinates
      game.cells[0].cell.should == dead_cell.cell
    end

    it "a single live cell dies" do
      live_cell = CellCoordinates.new(LiveCell.new, Coordinates.new)
      game = Game.new([live_cell])
      game.evolve
      game.should have(1).cells
      game.cells[0].should_not equal live_cell
      game.cells[0].coordinates.should == live_cell.coordinates
      game.cells[0].cell.should be_an_instance_of(DeadCell)
    end
  end
end
