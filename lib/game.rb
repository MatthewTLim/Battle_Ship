class Game
  def main_menu
   puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p" || input =="P"
     self.start
    elsif
    input == "q" || input == "Q"
    "EXIT"
    else
      nil
    end
  end

  def start
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @player_1 = Player.new("Player_1")
    @cpu_player = Player.new("CPU")

    @player_1.add_ship(@cruiser)
    @player_1.add_ship(@submarine)
    @cpu_player.add_ship(@cruiser)
    @cpu_player.add_ship(@submarine)

    puts "Please enter the coordinates to place your first ship
    your ship is #{@player_1.ships[0].length} spaces long."

    @p1_cruiser_coord = gets.chomp
    @p1_cruiser_formatted_coord = @p1_cruiser_coord.split
    @board.place(@cruiser, @p1_cruiser_formatted_coord)

    puts "Please enter the coordinates to place your second ship
    your ship is #{@player_1.ships[1].length} spaces long."

    @p1_submarine_coord = gets.chomp
    @p1_submarine_formatted_coord = @p1_submarine_coord.split
    @board.place(@submarine, @p1_submarine_formatted_coord)

    puts "Thanks I will now place my ships one moment"

    @p2_submarine_coord = 




    require 'pry'; binding.pry
  end
end