class Game

  def main_menu
   puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."
    input = gets.chomp
    if input == "p" || input =="P"
      set_up
      start
    elsif input == "q" || input == "Q"
      puts "EXIT"
    else
      main_menu
    end
  end

  def set_up
    @board = Board.new
    @npc_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @npc_cruiser = Ship.new("Cruiser", 3)
    @npc_submarine = Ship.new("Submarine", 2)
    @player_1 = Player.new("Player_1")
    @cpu_player = Player.new("CPU")
  end

  def start

    puts "Please enter the coordinates to place your first ship
    your ship is #{@cruiser.length} spaces long."
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)

    loop do
      @p1_cruiser_coord_unformatted = gets.chomp
      @p1_cruiser_coord = @p1_cruiser_coord_unformatted.upcase.delete('^a-zA-Z0-9 ')
      @p1_cruiser_formatted_coord = @p1_cruiser_coord.split
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
      @p1_submarine_coord_unformatted = gets.chomp
      @p1_submarine_coord = @p1_submarine_coord_unformatted.upcase.delete('^a-zA-Z0-9 ')
      @p1_submarine_formatted_coord = @p1_submarine_coord.split
      if @board.valid_placement?(@submarine, @p1_submarine_formatted_coord)
        break
      else 
        puts "Invalid placement, please try again."
      end
    end
    @board.place(@submarine, @p1_submarine_formatted_coord)

    puts "Thanks I will now place my ships, one moment please."
    @npc_board.randomly_place(@npc_cruiser)
    @npc_board.randomly_place(@npc_submarine)

    puts "I have placed my ships, let the battle begin!"
    puts "=============COMPUTER BOARD============="
    puts @npc_board.render(true)
    puts "==============PLAYER BOARD=============="
    puts @board.render(true)

    # Find a way to center the board
    loop do
      puts "Enter the coordinate for your shot:"
      loop do
        @user_shot_unformatted = gets.chomp
        @user_shot = @user_shot_unformatted.upcase.delete('^a-zA-Z0-9')
        if @npc_board.cells[@user_shot].fired_upon? == true
          puts "You've already fired upon this coordinate. Please pick a new coordinate."
        elsif @npc_board.valid_coordinate(@user_shot)
          break
        else  
          puts "Invalid coordinate, please try again."
        end
      end

      @npc_board.cells[@user_shot].fire_upon
      if @npc_cruiser.sunk? == true && @npc_submarine.sunk? == true 
        puts "=============COMPUTER BOARD============="
        puts @npc_board.render
        puts "==============PLAYER BOARD=============="
        puts @board.render(true)
        puts "You won!"
        break
      elsif @npc_board.cells[@user_shot].ship != nil && @npc_board.cells[@user_shot].ship.sunk? == true 
        puts "Your shot sunk my ship!"
      elsif @npc_board.cells[@user_shot].empty?
        puts "Your shot on #{@user_shot} was a miss!"
      else
        puts "Your shot on #{@user_shot} was a hit!"
      end
      puts "=============COMPUTER BOARD============="
      puts @npc_board.render

      loop do
        @shot_bank = @board.cells.keys.sample
        if @board.cells[@shot_bank].fired_upon? == true
          @shot_bank = @board.cells.keys.sample
        elsif @board.valid_coordinate(@shot_bank)
          break
        end
      end

      @board.cells[@shot_bank].fire_upon
      if @cruiser.sunk? == true && @submarine.sunk? == true 
        puts @board.render
        puts "I won!"
        break
      elsif @board.cells[@shot_bank].ship != nil && @board.cells[@shot_bank].ship.sunk? == true 
        puts "I sunk your ship!"
      elsif @board.cells[@shot_bank].empty?
        puts "My shot on #{@shot_bank} was a miss!"
      else 
        puts "My shot on #{@shot_bank} was a hit!"
      end
        puts "==============PLAYER BOARD=============="
        puts @board.render
    end
  end
end

