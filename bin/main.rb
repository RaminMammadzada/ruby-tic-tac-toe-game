#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/game'

class Main

  def start_game()
    puts '..:::GAME IS STARTED:::..'
    create_players
    puts "Welcome to the Tic - Tac - Toe game #{@player1.name} and #{@player2.name}"
    @game = Game.new(@player1, @player2)
    @game.board.print_board
    game_loop
    show_results
  end

  def self.inform_user(info_type, player = '')
    if info_type == 'invalid_input'
      puts 'Please enter the valid number as explained above!'
    elsif info_type == 'nonblank_input'
      puts 'That location is full, please enter the blank location!'
    elsif info_type == 'turn_info'
      puts "It is #{player.name}'s turn to play now."
      puts "Please enter location(1-9) to put #{player.tag} there!"
    elsif info_type == 'player2_namecheck'
      puts 'Be careful! Player 2 name must be different that Player 1 name'
    elsif info_type == 'character_namecheck'
      puts 'Please enter at least one character for player name!'
    end
  end

  private

  def create_players()
    num_array = [1, 2]
    num_array.each do |num|
      puts "Please enter player#{num} name: "
      player_name = gets.chomp
      player_name = include_characters(player_name)
      player_name = validate_player_name(player_name)
      num == 1 ? @player1 = Player.new(player_name, 'x') : @player2 = Player.new(player_name, 'o')
    end
  end

  def game_loop()
    loop do
      @game.move(@player1)
      break if @game.who_won != ''

      puts ''

      @game.move(@player2)
      break if @game.who_won != ''
    end
  end

  def show_results()
    if @game.who_won == 'draw'
      puts "It's a draw"
    else
      puts "Congratulations!   \
        The winner is #{@game.winner} !"
    end
  end

  def validate_player_name(player_1_name, player_2_name = 'not set')
    return player_1_name if player_2_name == 'not set'

    until player_2_name != player_1_name
      Main.inform_user('player2_namecheck')
      player_2_name = gets.chomp
    end
    player_2_name
  end

  def include_characters(name)
    until name.match?(/[A-Za-z]/) != false
      Main.inform_user('character_namecheck')
      name = gets.chomp
    end
    name
  end
end

main = Main.new
main.start_game
