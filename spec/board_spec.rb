require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe "#exists" do
    it "exists" do
      expect(@board).to be_a(Board)
    end

    it "has readble attributes" do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.values.first).to be_a(Cell)
      expect(@board.cells.keys.count).to eq(16)
    end
  end

  describe "#valid_coordinate" do
    it "can check if a coordinate is on the board or not" do
      expect(@board.valid_coordinate("A1")).to eq(true)
      expect(@board.valid_coordinate("D4")).to eq(true)
      expect(@board.valid_coordinate("A5")).to eq(false)
      expect(@board.valid_coordinate("E1")).to eq(false)
      expect(@board.valid_coordinate("A22")).to eq(false)
    end
  end

  describe "#valid_placement?" do
    it "can check if coordinates in the array are the same as the length of the ship" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "A3", "A4"])).to eq(false)
      # Add fringe tests here later
    end

    it "can make sure the coordinates are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      # Add fringe tests here later
    end
  end

  describe "#coordinate_formatter" do
    it "can return an array of coordicate numbers" do
      coordinates = ["A1", "A2", "A3"]
      expect(@board.coordinate_formatter(coordinates)).to eq([1, 2, 3])
    end
  end

  describe "#consecutive_check" do
    it "can tell if the coordinates are consecutive" do
      coordinates = ["A1", "A2", "A3"]
      expect(@board.consecutive_check(coordinates)).to eq(true)
    end
  end

  describe "#diagonal_check" do
    it "can tell if the cooridnates are diagonal from one another" do
      valid_coordinate = ["A1", "B2", "C3"]
      expect(@board.diagonal_check(valid_coordinate)).to eq(true)
   end
  end

  describe "#alpha_extractor" do
    it "can return an array of coordinate characters" do
      valid_characters = ["A1", "B1", "C1"]
      expect(@board.alpha_extractor(valid_characters)).to eq([65, 66, 67])
    end
  end
end