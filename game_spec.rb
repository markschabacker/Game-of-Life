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

    Spec::Matchers.define :contain_coordinates do |coordinates|
      match do |game|
        game.cells.select {|x| x.coordinates == coordinates}.length > 0
      end
    end

    Spec::Matchers.define :have_dead_cell_at do |coordinates|
      match do |game|
        game.cells.select {|x| x.coordinates == coordinates && x.cell.instance_of?(DeadCell)}.length > 0
      end
    end

    Spec::Matchers.define :have_live_cell_at do |coordinates|
      match do |game|
        game.cells.select {|x| x.coordinates == coordinates && x.cell.instance_of?(LiveCell)}.length > 0
      end
    end

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
      game.should have_dead_cell_at(dead_cell.coordinates)
    end

    it "a single live cell dies" do
      live_cell = CellCoordinates.new(LiveCell.new, Coordinates.new)
      game = Game.new([live_cell])
      game.evolve
      game.should have(1).cells
      game.cells[0].should_not equal live_cell
      game.should have_dead_cell_at(live_cell.coordinates)
    end

    it "a 2x2 square live block lives on" do
      top_left = CellCoordinates.new(LiveCell.new, Coordinates.new(0,0))
      top_right = CellCoordinates.new(LiveCell.new, Coordinates.new(1,0))
      bottom_left = CellCoordinates.new(LiveCell.new, Coordinates.new(0,1))
      bottom_right = CellCoordinates.new(LiveCell.new, Coordinates.new(1,1))

      input_cells = [top_left, top_right, bottom_left, bottom_right]
      game = Game.new(input_cells)
      game.evolve
      game.should have(4).cells
      input_cells.each do |cell|
        game.should contain_coordinates(cell.coordinates)
        game.should have_live_cell_at(cell.coordinates)
      end
    end

    it "a 1x3 line becomes a 3x1 line (blinker)" do
      initial_board = [
        ["X","X","X","X","X"],
        ["X","X","X","X","X"],
        ["X","!","!","!","X"],
        ["X","X","X","X","X"],
        ["X","X","X","X","X"]
      ]
      expected_board =
"X X X X X
X X ! X X
X X ! X X
X X ! X X
X X X X X"
      game = GraphicalGame.new(initial_board)
      game.evolve.should == expected_board
    end
  end
end
