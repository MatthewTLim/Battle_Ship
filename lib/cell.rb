class Cell
  attr_reader :coordinates, :ship

  def initialize(coordinates)
    @coordinates = coordinates
    @ship = nil
    @fired_at = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_at 
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fired_at = true
    else
      @fired_at = true
    end
  end

  def render(option = false)
    if @fired_at == true && @ship == nil
      "M"
    elsif empty? == false && fired_upon? == false && option == true
      "S"
    elsif fired_upon? == true && @ship.sunk? == true
      "X"
    elsif fired_upon? == true && @ship.health != @ship.length
      "H"
    else
      "."
    end
  end
end