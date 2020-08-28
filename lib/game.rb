require_relative './board'
# This is a class which all of the methods about user interface will be in
class Game
  attr_reader :winner, :board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new(@player1, @player2)
    @winner = ''
  end

  private

  def input_is_valid?(user_move)
    if user_move.to_i >= 1 && user_move.to_i <= 9
      if @board.blank?(user_move)
        true
      else
        Main.inform_user('nonblank_input')
        false
      end
    else
      false
    end
  end

  def any_empty?
    @board.board.values.any?(' ')
  end

  public

  def move(player)
    Main.inform_user('turn_info', player.name)
    player_move = ''

    loop do
      player_move = gets.chomp
      break if input_is_valid?(player_move)

      Main.inform_user('invalid_input')
    end

    @board.update_board(player_move, player)
    @board.print_board
  end

  def who_won
    check_diagonal
    check_horizontal
    check_vertical
    if @player1.is_winner
      @winner = @player1.name
      @player1.name
    elsif @player2.is_winner
      @winner = @player2.name
      @player2.name
    elsif @board.any_empty?
      ''
    else
      @winner = 'draw'
      'draw'
    end
  end

  private

  def check_horizontal
    horizontal1 = [@board.board['1'], @board.board['2'], @board.board['3']]
    horizontal2 = [@board.board['4'], @board.board['5'], @board.board['6']]
    horizontal3 = [@board.board['7'], @board.board['8'], @board.board['9']]
    if horizontal1.all?(@player1.tag) || \
       horizontal2.all?(@player1.tag) || \
       horizontal3.all?(@player1.tag)
      @player1.is_winner = 1
    end
    if horizontal1.all?(@player2.tag) || \
       horizontal2.all?(@player2.tag) || \
       horizontal3.all?(@player2.tag)
      @player2.is_winner = 1
    end
  end

  def check_vertical
    vertical1 = [@board.board['1'], @board.board['4'], @board.board['7']]
    vertical2 = [@board.board['2'], @board.board['5'], @board.board['8']]
    vertical3 = [@board.board['3'], @board.board['6'], @board.board['9']]
    if vertical1.all?(@player1.tag) || \
       vertical2.all?(@player1.tag) || \
       vertical3.all?(@player1.tag)
      @player1.is_winner = 1
    end
    if vertical1.all?(@player2.tag) || \
       vertical2.all?(@player2.tag) || \
       vertical3.all?(@player2.tag)
      @player2.is_winner = 1
    end
  end

  def check_diagonal
    diagonal1 = [@board.board['1'], @board.board['5'], @board.board['9']]
    diagonal2 = [@board.board['3'], @board.board['5'], @board.board['7']]
    @player1.is_winner = 1 if diagonal1.all?(@player1.tag) || diagonal2.all?(@player1.tag)
    @player2.is_winner = 1 if diagonal1.all?(@player2.tag) || diagonal2.all?(@player2.tag)
  end
end
