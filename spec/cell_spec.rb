require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
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

  describe "#fired_upon?" do
    it "can check if it has been fired at" do
      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to eq(false)
    end
  end

  describe "fire_upon" do
    it "can subtract 1 health from the ship when it is fired upon" do
      @cell.place_ship(@cruiser)
      @cell.fire_upon

      expect(@cell.ship.health).to eq(2)
      expect(@cell.fire_upon?).to eq(true)
    end
  end
end