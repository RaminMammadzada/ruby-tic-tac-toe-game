# This is a class which all of the methods about user interface will be in
class Game
  attr_accessor :board
  def initialize(player1, player2)
    @board = { '1' => ' ', '2' => ' ', '3' => ' ',
               '4' => ' ', '5' => ' ', '6' => ' ',
               '7' => ' ', '8' => ' ', '9' => ' ' }
    @player1 = player1
    @player2 = player2
  end

  def print_board
    print @board['1'] + '|' + @board['2'] + '|' + @board['3']
    puts
    puts '-+-+-'
    print @board['4'] + '|' + @board['5'] + '|' + @board['6']
    puts
    puts '-+-+-'
    print @board['7'] + '|' + @board['8'] + '|' + @board['9']
  end

  def update_board(move, player)
    if @board[move] == 'x' || @board[move] == 'o'
      puts 'Please try the empty boxes!'
    elsif player == @player1
      @board[move] = 'x'
    else
      @board[move] = 'o'
    end
  end

  def input_is_valid?(user_move)
    return user_move.to_i >= 1 && user_move.to_i <=9
  end

  def is_blank?(location)
    return @board[location] == ' '
  end

  def is_any_empty?
    @board.values.any?(" ")
  end
end
