require './lib/ship'

RSpec.describe Ship do
  before do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe "#exists" do
    it "exists"do
    expect(@cruiser).to be_a(Ship)
    end
    it "has readable attributes" do
      expect(@cruiser.name).to eq("Cruiser")
      expect(@cruiser.length).to eq(3)
      expect(@cruiser.health).to eq(3)
    end
  end

  describe "#sunk?" do
    xit "can tell if the ship is sunk or not" do
      expect(@cruiser.sunk?).to eq(false)
    end

    xit "can be sunk after its health is reduced to 0" do
      @cruiser.hit
      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.sunk?).to eq(true)
    end
  end

  describe "#hit" do
    xit "can hit the ship" do
      @cruiser.hit
      expect(@cruiser.health).to eq(2)
    end


    it "can sink the "
  end
end