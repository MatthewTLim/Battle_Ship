class Cell
  attr_reader :coordinates, :ship

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @ship.health != @ship.length
  end

  def fire_upon
    @ship.hit
  end
end