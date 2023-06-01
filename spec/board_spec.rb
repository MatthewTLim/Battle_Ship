require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
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
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A1", "A3", "A4"])).to eq(false)
    end

    it "can make sure the coordinates are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    end

    it "can make sure a ship will not be placed diagonally" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "B4", "D2"])).to eq(false)
    end

    it "will not place a ship if the cell already contains a ship" do
      @board.place(@cruiser, ["A1", "A2", "A3"] )
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end

    describe "#coordinate_formatter" do
      it "can return an array of coordinate numbers" do
        coordinates = ["A1", "A2", "A3"]
        expect(@board.coordinate_formatter(coordinates)).to eq([1, 2, 3])
      end
    end

    describe "#consecutive_check" do
      it "can tell if the coordinates are consecutive" do
        coordinates = ["A1", "A2", "A3"]
        coordinates2 = ["A1", "A4", "C4"]
        expect(@board.consecutive_check(coordinates)).to eq(true)
        expect(@board.consecutive_check(coordinates2)).to eq(false)
      end
    end

    describe "#diagonal_check" do
      it "can tell if the cooridnates are diagonal from one another" do
        valid_coordinate = ["A1", "B2", "C3"]
        expect(@board.diagonal_check(valid_coordinate)).to eq(false)
     end
    end

    describe "#ordinal_extractor" do
      it "can return an array of coordinate characters" do
        valid_characters = ["A1", "B1", "C1"]
        expect(@board.ordinal_extractor(valid_characters)).to eq([65, 66, 67])
      end
    end

    describe "#overlap_check" do
      it "can check if a cell contains a ship" do
        overlapped_coordinates = ["A1", "A2", "A3"]
        test_coordinates = ["A1", "A2", "A4"]
        good_coords = ["B2", "B3", "B4"]

        @board.place(@cruiser, overlapped_coordinates)

        expect(@board.overlap_check(overlapped_coordinates)).to eq(false)
        expect(@board.overlap_check(test_coordinates)).to eq(false)
        expect(@board.overlap_check(good_coords)).to eq(true)
      end
    end
  end

  describe "#place" do
    it "can place a ship in its cells" do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_2.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cruiser)
      expect(@cell_3.ship == @cell_2.ship).to eq(true)
    end
  end

  describe "#render" do
    it "can render a String representation of itself to display to the user all of its cells in a formatted grid" do

      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it "can render ships on the board when option is true" do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end

  describe "#render_assistant" do
    it "can add renderable spaces to board i.e.(., M, S, H, X)" do
      expect(@board.render_assistant).to eq([". . . .", ". . . .", ". . . .", ". . . ."])
    end
  end

  describe "#randomly_place" do
    it "can randomly place ships in cells" do
      place = @board.randomly_place(@cruiser)

      expect(place.length).to eq(3)
      expect(@board.cells[place[0]].ship).to eq(@cruiser)
      expect(@board.cells[place[1]].ship).to eq(@cruiser)
      expect(@board.cells[place[2]].ship).to eq(@cruiser)
    end
  end
end