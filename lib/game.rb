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
    if @board[move] == @player1.tag || @board[move] == @player2.tag
      puts 'Please try the empty boxes!'
    elsif player == @player1
      @board[move] = @player1.tag
    else
      @board[move] = @player2.tag
    end
  end

  def input_is_valid?(user_move)
    if user_move.to_i >= 1 && user_move.to_i <= 9
      if blank?(user_move)
        return true
      else
        puts 'That location is full, please enter the blank location!'
        return false
      end
    else
      return false
    end
  end

  def blank?(location)
    @board[location] == ' ' # this will return true ONLY if the box in spesified location is empty
  end

  def any_empty?
    @board.values.any?(' ')
  end

  def move(player)
    puts "It is #{player.name}'s turn to play now."
    puts "#{player.name}, please enter location(1-9) to puts x there!"
    player_move = ''

    loop do
      player_move = gets.chomp

      if input_is_valid?(player_move)
        break
      else
        puts 'Please enter the valid number as explained above!'
      end
    end

    update_board(player_move, player)
    print_board
    puts
  end
end

# rubocop:enable Metrics/AbcSize,Metrics/MethodLength,Style/GuardClause
