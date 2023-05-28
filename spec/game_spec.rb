require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'


RSpec.describe Game do
  before do
    @game = Game.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
  end

  describe "#main_menu" do
    it "puts main menu message and takes user input to navigate to next screen" do
      expect(@game.main_menu).to eq("Welcome to BATTLESHIP\n    Enter p to play. Enter q to quit.")
    end
  end

  describe "#start" do
    it "can add ships to each of the players" do
      expect(@game.start).to eq("")

    end
  end
end