class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate(coordinate)
   searched_cell = false
   @cells.each do |cell|
    if cell[0] == coordinate
      searched_cell = true
    end
   end
   searched_cell
  end

  def valid_placement?(ship, coordinates)
    # require 'pry'; binding.pry
    ship.length == coordinates.count && consecutive_check(coordinates) == true
  end

  def coordinate_formatter(coordinates)
    valid_coord = coordinates.map { |coordinate| coordinate.delete('^0-9') }
    formatted_coord = valid_coord.map { |coordinate| coordinate.to_i}
    formatted_coord
  end

  def consecutive_check(coordinates)
    coordinate_formatter(coordinates).each_cons(coordinates.count - 1).all? { |first_coord, second_coord| second_coord == first_coord + 1}
    # require 'pry'; binding.pry
  end
end