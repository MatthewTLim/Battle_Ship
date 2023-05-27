require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before do
    @board = Board.new
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

  describe "#valid_coordinate?" do
    it "can check if a coordinate is on the board or not" do
      expect(@board.valid_coordinate("A1")).to eq(true)
      expect(@board.valid_coordinate("D4")).to eq(true)
      expect(@board.valid_coordinate("A5")).to eq(false)
      expect(@board.valid_coordinate("E1")).to eq(false)
      expect(@board.valid_coordinate("A22")).to eq(false)
    end
  end
end