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
    it "can check if the ship is being placed on to board properly" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "A3", "A4"])).to eq(false)
    end
  end
end