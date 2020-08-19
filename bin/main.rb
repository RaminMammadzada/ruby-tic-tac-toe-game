class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Game
  attr_accessor :board
  def initialize(player1, player2)
    @board =  {'1' => ' ', '2' => ' ', '3'=> ' ',
               '4' => ' ', '5' => ' ', '6'=> ' ',
               '7' => ' ', '8' => ' ', '9'=> ' '}
    @player1 = player1
    @player2 = player2
  end

  def print_board()
    print @board['1'] + "|" + @board['2']+ "|" + @board['3']
    puts
    puts"--+-+--"
    print @board['4'] + "|" + @board['5']+ "|" + @board['6']
    puts
    puts"--+-+--"
    print @board['7'] + "|" + @board['8']+ "|" + @board['9']
  end

  def update_board(move, player)
    if @board[move] == 'x' or @board[move] == 'o'
      puts "Please try the empty boxes!"
    elsif player == @player1
      @board[move] = 'x'
    else
      @board[move] = 'o'
    end
  end
end

puts "Please enter player1 name: "
player_1_name = gets.chomp
player_1 = Player.new(player_1_name)


puts "Please enter player2 name: "
player_2_name = gets.chomp
player_2 = Player.new(player_2_name)

game = Game.new(player_1, player_2)

puts "Welcome to the Tic - Tac - Toe game #{player_1.name} and #{player_2.name}"

puts"It is #{player_1.name}'s turn to play now."
puts "Player1 please enter location(1-9) to puts x there!"
player1_move = gets.chomp
game.update_board(player1_move, player_1)
game.print_board()

puts

puts"It is #{player_2.name}'s turn to play now."
puts "Player1 please enter location(1-9) to puts x there!"
player2_move = gets.chomp
game.update_board(player2_move, player_2)
game.print_board()
