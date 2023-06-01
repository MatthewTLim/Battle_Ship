require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require 'artii'
require 'colorize'

@game = Game.new

loop do
    @game.main_menu
end