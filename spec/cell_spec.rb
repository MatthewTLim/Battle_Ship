require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before do
    @cell = Cell.new("B4")
  end

  describe "#exists" do
    it "exists" do
      expect(@cell).to be_a(Cell)
    end

    it "has readable attributes" do
      expect(@cell.coordinates).to eq("B4")
      expect(@cell.ship).to eq(nil)
    end
  end

  describe "#empty?" do
    it "can check if a cell is empty" do
      expect(@cell.empty?).to eq(true)
    end
  end

  describe "#place_ship" do
    it "can place a ship within a cell" do
      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end
end