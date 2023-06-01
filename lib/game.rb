class Game

  def initialize
    @board = Board.new
    @npc_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @npc_cruiser = Ship.new("Cruiser", 3)
    @npc_submarine = Ship.new("Submarine", 2)
    @player_1 = Player.new("Player_1")
    @cpu_player = Player.new("CPU")
  end

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

    # @player_1.add_ship(@cruiser)
    # @player_1.add_ship(@submarine)
    # @cpu_player.add_ship(@cruiser)
    # @cpu_player.add_ship(@submarine)

    puts "Please enter the coordinates to place your first ship
    your ship is #{@cruiser.length} spaces long."

    # Add function to remove commas and account for lower case letters
    loop do
      @p1_cruiser_coord = gets.chomp
      @p1_cruiser_formatted_coord = @p1_cruiser_coord.split
        # require 'pry'; binding.pry
      if @board.valid_placement?(@cruiser, @p1_cruiser_formatted_coord)
        break
      else
        puts "Invalid placement, please try again."
      end
    end
    @board.place(@cruiser, @p1_cruiser_formatted_coord)

    puts "Please enter the coordinates to place your second ship
    your ship is #{@submarine.length} spaces long."

    loop do
      @p1_submarine_coord = gets.chomp
      @p1_submarine_formatted_coord = @p1_submarine_coord.split
      if @board.valid_placement?(@submarine, @p1_submarine_formatted_coord)
        break
      else 
        puts "Invalid placement, please try again."
      end
    end
    @board.place(@submarine, @p1_submarine_formatted_coord)

    puts "Thanks I will now place my ships one moment"
    @npc_board.randomly_place(@npc_cruiser)
    @npc_board.randomly_place(@npc_submarine)
    puts "I have placed my ships, let the battle begin!"
  end
end