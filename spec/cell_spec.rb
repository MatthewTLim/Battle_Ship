require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#exists" do
    it "exists" do
      expect(@cell_1).to be_a(Cell)
    end

    it "has readable attributes" do
      expect(@cell_1.coordinates).to eq("B4")
      expect(@cell_1.ship).to eq(nil)
    end
  end

  describe "#empty?" do
    it "can check if a cell is empty" do
      expect(@cell_1.empty?).to eq(true)
    end
  end

  describe "#place_ship" do
    it "can place a ship within a cell" do
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe "#fired_upon?" do
    it "can check if it has been fired at" do
      @cell_1.place_ship(@cruiser)
      # require 'pry'; binding.pry
      expect(@cell_1.fired_upon?).to eq(false)
    end
  end

  describe "fire_upon" do
    it "can subtract 1 health from the ship when it is fired upon" do
      @cell_1.place_ship(@cruiser)
      @cell_1.fire_upon

      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.fired_upon?).to eq(true)
    end
  end

  describe "#render" do
    it "renders . if the cell has not been fired upon" do
      @cell_1.place_ship(@cruiser)

      expect(@cell_1.render).to eq(".")
    end

    it "renders M if the cell has been fired upon and it does not contain a ship" do
      @cell_1.fire_upon

      expect(@cell_1.render).to eq("M")
    end

    it "renders H if the cell has been fired upon and it contains a ship (the shot was a hit)." do

    end

    xit "renders “X” if the cell has been fired upon and its ship has been sunk. " do

    end
  end
end