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
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count && consecutive_check(coordinates) == true &&
    diagonal_check(coordinates) == true && overlap_check(coordinates) == true
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
   (coordinate_integer_comparison(coordinates) || coordinate_formatter(coordinates).uniq.length == 1) &&
   (coordinate_ordinal_comparison(coordinates) || ordinal_extractor(coordinates).uniq.length == 1)
  end

  def coordinate_integer_comparison(coordinates)
    coordinate_formatter(coordinates).each_cons(2).all? { |first_coord, second_coord| second_coord == first_coord + 1}
  end

  def coordinate_ordinal_comparison(coordinates)
    ordinal_extractor(coordinates).each_cons(2).all? { |first_coord, second_coord| second_coord == first_coord + 1}
  end

  def diagonal_check(coordinates)
    coordinate_formatter(coordinates).uniq.length == 1 || ordinal_extractor(coordinates).uniq.length == 1
  end

  def overlap_check(coordinates)
    coordinates.all? { |coord| @cells[coord] && @cells[coord].empty? } 
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      if @cells.key?(coordinate)
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(option = false)
    a = []
    range = "A".."D"

    render_assistant(option).each_slice(4) do |group|
      range.each do |letter|
         a << letter + " " + group.shift
      end
    end

    line_1 = "  1  2  3  4  \n".colorize(:red)
    result = line_1 + a.join(" \n").colorize(:red) + " \n"
  end

  def render_assistant(option = false)
    formatted = []

    @cells.each_slice(4) do |group|
      unformatted = []
      group.each do |_, cell|
        unformatted << cell.render(option)
      end
      formatted << unformatted.join(" ")
    end
    formatted
  end

  def randomly_place(ship)
    placement = random_cells(ship)
    place(ship, placement)
  end

  def random_cells(ship)
    options = cells.keys
    placement = options.sample(ship.length)
    until valid_placement?(ship, placement)
      placement = options.sample(ship.length)
    end
    placement
  end
end