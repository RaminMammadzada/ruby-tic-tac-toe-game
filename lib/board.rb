# This class is responsible to keep the game board updated
class Board
  attr_reader :board
  def initialize(player1, player2)
    @board = { '1' => ' ', '2' => ' ', '3' => ' ',
               '4' => ' ', '5' => ' ', '6' => ' ',
               '7' => ' ', '8' => ' ', '9' => ' ' }
    @player1 = player1
    @player2 = player2
  end

  def create_line_in_board(num)
    print @board[(num + 1).to_s] + \
          '|' + @board[(num + 2).to_s] + \
          '|' + @board[(num + 3).to_s]
  end

  def print_board
    [0, 3, 6].each do |num|
      create_line_in_board(num)
      puts
      next if num == 6

      puts '-+-+-'
    end
  end

  def update_board(move, player)
    @board[move] = if player == @player1
                     @player1.tag
                   else
                     @player2.tag
                   end
  end

  def blank?(location)
    @board[location] == ' '
  end
end
