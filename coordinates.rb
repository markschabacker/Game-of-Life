class Coordinates
  attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def distance_between(other_coords)
    Math.hypot(@x - other_coords.x, @y - other_coords.y)
  end
end
