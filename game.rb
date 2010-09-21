require 'cell_coordinates'
require 'coordinates'
require 'live_cell'
require 'dead_cell'
require 'cell_count_visitor'

class Game
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def evolve
    evolved_cells = []
    @cells.each do |cell|
      neighbor_cells = @cells.select {|x| cell.coordinates.is_neighbor?(x.coordinates)}
      live_cell_count_visitor = CellCountVisitor.new
      neighbor_cells.each do |neighbor|
        neighbor.cell.accept_visitor(live_cell_count_visitor)
      end
      evolved_cells << CellCoordinates.new(cell.cell.alive_next_iteration?(live_cell_count_visitor.count), cell.coordinates)
    end
    @cells = evolved_cells
  end
end

class GraphicalGame < Game
  CELL_TO_REP = {LiveCell => "!", DeadCell => "X"}
  REP_TO_CELL = {"!" => LiveCell.new, "X" => DeadCell.new }

  def initialize(board)
    @cells = []
    board = board.split("\n").map(&:split)
    board.each_with_index do |r, ri|
      r.each_with_index do |c, ci|
        cell = REP_TO_CELL[c]
        coor = Coordinates.new(ri, ci)
        ccoor = CellCoordinates.new(cell, coor)
        @cells << ccoor
      end
    end
    super(@cells)
  end
  def evolve
    super
    @graph = []
    x_max = @cells.map {|cc| cc.coordinates.x}.max
    0.upto(x_max) do
      @graph << []
    end
    @cells.each do |c|
      rep = CELL_TO_REP[c.cell.class]
      @graph[c.coordinates.x][c.coordinates.y] = rep
    end
    @graph.map {|r| r.join(" ")}.join("\n")
  end
end
