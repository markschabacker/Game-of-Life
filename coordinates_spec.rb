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
  end

  it "returns 0.0 when calculating the distance to itself" do
    coord = Coordinates.new
    coord.distance_between(coord).should be_close(0, 0.1)
  end
  
  1.upto(5) do |n|
    it "returns #{n} when calculating the distance to a coordinate #{n} unit to the right" do
      source_coord = Coordinates.new(0,0);
      dest_coord = Coordinates.new(n,0);
      source_coord.distance_between(dest_coord).should be_close(n, 0.1)
    end
    
    it "returns #{n} when calculating the distance to a coordinate #{n} 1 unit to the left" do
      source_coord = Coordinates.new(0,0);
      dest_coord = Coordinates.new(-n,0);
      source_coord.distance_between(dest_coord).should be_close(n, 0.1)
    end
      
    it "returns #{n} when calculating the distance to a coordinate #{n} 1 unit up" do
      source_coord = Coordinates.new(0,0);
      dest_coord = Coordinates.new(0,-n);
      source_coord.distance_between(dest_coord).should be_close(n, 0.1)
    end
    
    it "returns #{n} when calculating the distance to a coordinate #{n} 1 unit down" do 
      source_coord = Coordinates.new(0,0);
      dest_coord = Coordinates.new(n,0);
      source_coord.distance_between(dest_coord).should be_close(n, 0.1)
    end
  end

  it "returns sqrt(2) when calculating the distance to a coordinate 1 unit up and one unit to the left" do
    source_coord = Coordinates.new(0,0)
    dest_coord = Coordinates.new(-1, -1)
    source_coord.distance_between(dest_coord).should be_close(Math.sqrt(2), 0.1)
  end

end
