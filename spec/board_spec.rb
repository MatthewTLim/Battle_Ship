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

  
end