class Player
  attr_reader :ships, :name
  def initialize(name)
    @name = name
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end
end