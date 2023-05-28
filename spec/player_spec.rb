require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'

RSpec.describe Player do
  before do
    @player_1 = Player.new
    @player_2 = Player.new
    # @game = Game.new
    # @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    # @cell_1 = @board.cells["A1"]
    # @cell_2 = @board.cells["A2"]
    # @cell_3 = @board.cells["A3"]
  end

  describe "#exists" do
    it "exists" do
      expect(@player_1).to be_a(Player)
    end

    it "has readable attributes" do
      expect(@player_1.ships).to eq([])
    end
  end

  describe "#add_ship" do
    it "can add a ship to the ships array" do
      @player_1.add_ship(@cruiser)
      @player_1.add_ship(@submarine)

      expect(@player_1.ships).to eq([@cruiser, @submarine])
      expect(@player_1.ships.count).to eq(2)
    end
  end
end