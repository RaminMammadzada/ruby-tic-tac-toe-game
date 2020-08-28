# This is a class which all of the methods about user interface will be in
class Game
  attr_accessor :board, :winner
  def initialize(player1, player2)
    @board = { '1' => ' ', '2' => ' ', '3' => ' ',
               '4' => ' ', '5' => ' ', '6' => ' ',
               '7' => ' ', '8' => ' ', '9' => ' ' }
    @player1 = player1
    @player2 = player2
    @winner = ''
  end

  private

  def create_line_in_board(num)
    print @board[(num + 1).to_s] + \
          '|' + @board[(num + 2).to_s] + \
          '|' + @board[(num + 3).to_s]
  end

  def print_board
    [0, 3, 6].each do |num|
      create_line_in_board(num)
      puts
      puts '-+-+-'
    end
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
        true
      else
        puts 'That location is full, please enter the blank location!'
        false
      end
    else
      false
    end
  end

  def blank?(location)
    @board[location] == ' '
  end

  def any_empty?
    @board.values.any?(' ')
  end

  public

  def move(player)
    puts "It is #{player.name}'s turn to play now."
    puts
    puts "#{player.name}, please enter location(1-9) to puts x there!"
    player_move = ''

    loop do
      player_move = gets.chomp
      break if input_is_valid?(player_move)

      puts 'Please enter the valid number as explained above!'
    end

    # Randomly we are making player 2 winner
    # here when there are 4 empty boxes
    @player2.is_winner = true if @board.values.count(' ') == 4

    update_board(player_move, player)
    print_board
  end

  def who_won
    if @player1.is_winner
      @player1.name
    elsif @player2.is_winner
      @player2.name
    elsif any_empty?
      ''
    else
      'draw'
    end
  end
end
