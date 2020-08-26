require_relative './Board'
# This is a class which all of the methods about user interface will be in
class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
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

  def any_empty?
    @board.values.any?(" ")
  end

  def move(player)
    puts "It is #{player.name}'s turn to play now."
    puts "#{player.name}, please enter location(1-9) to puts x there!"
    player_move = ''

    loop do
      player_move = gets.chomp
      break if input_is_valid?(player_move)

      if input_is_valid?(player_move)
        if @board.blank?(player_move)
          break
        else
          puts 'That location is full, please enter the blank location!'
        end
      else
        puts 'Please enter the valid number as explained above!'
      end
    end

    @board.update_board(player_move, player)
    @board.print_board
    puts
  end

  def check_winner()

  end

  def check_winner()

  end
end

# rubocop:enable
