require 'coordinates'

describe Coordinates do
  context "represents point" do
    it "(0,0) when initialized without parameters" do
      coord = Coordinates.new
      coord.x.should be 0
      coord.y.should be 0
    end

    it "(0,0) when initialized with parameters(0,0)" do
      coord = Coordinates.new(0,0)
      coord.x.should be 0
      coord.y.should be 0
    end

    it "(-4,2) when initialized with parameters(-4,2)" do
      coord = Coordinates.new(-4,2)
      coord.x.should be -4
      coord.y.should be 2
    end
  end

  context "when calculating neighbors" do
    [-1, 1].each do |n|
      it "returns true when asked if a cell #{n} horizontal units away is its neighbor" do
        source_coord = Coordinates.new
        dest_coord = Coordinates.new(n, 0)
        source_coord.is_neighbor?(dest_coord).should be true
      end
    end
    
    [-1, 1].each do |n|
      it "returns true when asked if a cell #{n} vertical units away is its neighbor" do
        source_coord = Coordinates.new
        dest_coord = Coordinates.new(0, n)
        source_coord.is_neighbor?(dest_coord).should be true
      end
    end
    
    [[-1,-1], [1,-1], [-1,1], [1,1]].each do |x,y|
      it "returns true when asked if a cell #{x} horizontal units away and #{y} vertial units away is its neighbor" do
        source_coord = Coordinates.new
        dest_coord = Coordinates.new(x,y)
        source_coord.is_neighbor?(dest_coord).should be true
      end
    end 

    [ [-2,-2], [-1, -2], [0,-2], [1,-2],  [2,-2],
      [-2,-1],                            [2,-1],
      [-2,0],                             [2,0],
      [-2,1],                             [2,1],
      [-2,2], [-1,2], [0,2], [1,2],       [2,2]].each do |x,y|
        it "returns false when asked if a cell #{x} horizontal units away and #{y} vertial units away is its neighbor" do
          source_coord = Coordinates.new
          dest_coord = Coordinates.new(x,y)
          source_coord.is_neighbor?(dest_coord).should be false 
        end
      end
  end

end
