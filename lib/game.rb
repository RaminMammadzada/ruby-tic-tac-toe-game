require_relative './Board'
# This is a class which all of the methods about user interface will be in
class Game
  attr_accessor :winner
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(@player1, @player2)
    @winner = ""
  end

  def input_is_valid?(user_move)
    if user_move.to_i >= 1 && user_move.to_i <= 9
      if @board.blank?(user_move)
        true
      else
        puts 'That location is full, please enter the blank location!'
        false
      end
    else
      false
    end
  end

  def any_empty?
    @board.board.values.any?(" ")
  end

  def move(player)
    puts "It is #{player.name}'s turn to play now."
    puts "#{player.name}, please enter location(1-9) to puts x there!"
    player_move = ''

    loop do
      player_move = gets.chomp
      break if input_is_valid?(player_move)

      puts 'Please enter the valid number as explained above!'
    end

    @board.update_board(player_move, player)
    @board.print_board
  end

  def who_won()
    check_diagonal
    check_horizontal
    check_vertical

    if @player1.is_winner
      @winner = @player1.name
      return @player1.name
    elsif @player2.is_winner
      @winner = @player2.name
      return @player2.name
    elsif @board.any_empty?
      return ""
    else
      @winner = "draw"
      return "draw"
    end
  end

  def check_horizontal()
    horizontal_1 = [@board.board['1'], @board.board['2'], @board.board['3']]
    horizontal_2 = [@board.board['4'], @board.board['5'], @board.board['6']]
    horizontal_3 = [@board.board['7'], @board.board['8'], @board.board['9']]
    @player1.is_winner = 1 if horizontal_1.all?(@player1.tag) || horizontal_2.all?(@player1.tag) || horizontal_3.all?(@player1.tag)
    @player2.is_winner = 1 if horizontal_1.all?(@player2.tag) || horizontal_2.all?(@player2.tag) || horizontal_3.all?(@player2.tag)
  end

  def check_vertical()
    vertical_1 = [@board.board['1'], @board.board['4'], @board.board['7']]
    vertical_2 = [@board.board['2'], @board.board['5'], @board.board['8']]
    vertical_3 = [@board.board['3'], @board.board['6'], @board.board['9']]
    @player1.is_winner = 1 if vertical_1.all?(@player1.tag) || vertical_2.all?(@player1.tag) || vertical_3.all?(@player1.tag)
    @player2.is_winner = 1 if vertical_1.all?(@player2.tag) || vertical_2.all?(@player2.tag) || vertical_3.all?(@player2.tag)
  end

  def check_diagonal()
    diagonal_1 = [@board.board['1'], @board.board['5'], @board.board['9']]
    diagonal_2 = [@board.board['3'], @board.board['5'], @board.board['7']]
    @player1.is_winner = 1 if diagonal_1.all?(@player1.tag) || diagonal_2.all?(@player1.tag)
    @player2.is_winner = 1 if diagonal_1.all?(@player2.tag) || diagonal_2.all?(@player2.tag)
  end

end
