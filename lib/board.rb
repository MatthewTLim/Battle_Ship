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
    ship.length == coordinates.count && consecutive_check(coordinates) == true && diagonal_check(coordinates) == false && overlap_check(coordinates) == false
  end

  def coordinate_formatter(coordinates)
    valid_coord = coordinates.map { |coordinate| coordinate.delete('^0-9') }
    formatted_coord = valid_coord.map { |coordinate| coordinate.to_i}
    formatted_coord
  end

  def ordinal_extractor(coordinates)
    characters = coordinates.map { |coordinate| coordinate.delete('^A-Z') }
    characters.map { |character| character.ord}
  end

  def consecutive_check(coordinates)
    coordinate_integer_comparison(coordinates) == true
  end

  def coordinate_integer_comparison(coordinates)
    coordinate_formatter(coordinates).each_cons(coordinates.count - 1).all? { |first_coord, second_coord| second_coord == first_coord + 1}
  end

  def coordinate_ordinal_comparison(coordinates)
    ordinal_extractor(coordinates).each_cons(coordinates.count - 1).all? { |first_coord, second_coord| second_coord == first_coord + 1}
  end

  def diagonal_check(coordinates)
    coordinate_integer_comparison(coordinates) == true && coordinate_ordinal_comparison(coordinates) == true
  end

  def overlap_check(coordinates)
    overlap = false
    coordinates.each do |coordinate|
      @cells[coordinate].empty? == false
      overlap = true
      # break
    end
    overlap
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      if @cells.key?(coordinate)
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render
    a = []
    range = "A".."D"

    render_assistant.each_slice(4) do |group|
      range.each do |letter|
         a << letter + " " + group.shift
        end
        # require 'pry'; binding.pry
      end

      line_1 = "  1 2 3 4 "
      result = line_1 + a.join(" ")
  end

def render_assistant
  formatted = []
  @cells.each_slice(4) do |group|
    unformatted = []
    group.each do |_, cell|

      unformatted << cell.render
      # require 'pry'; binding.pry
    end
    formatted << unformatted.join(" ")
  end
  formatted
end
end