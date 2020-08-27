#!/usr/bin/env ruby
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/helper'

puts 'Please enter player1 name: '
player_1_name = gets.chomp
player_1_name = Helper.character_only(player_1_name)
player_1_name = Helper.validate_player_name(player_1_name)
player1 = Player.new(player_1_name, 'x')

puts 'Please enter player2 name: '
player_2_name = gets.chomp
player_2_name = Helper.character_only(player_2_name)
player_2_name = Helper.validate_player_name(player_1_name, player_2_name)
player2 = Player.new(player_2_name, 'o')

game = Game.new(player1, player2)
puts '..:::GAME IS STARTED:::..'
puts "Welcome to the Tic - Tac - Toe game #{player1.name} and #{player2.name}"
game.board.print_board
loop do
  game.move(player1)
  break if game.who_won != ''

  puts ''

  game.move(player2)
  break if game.who_won != ''
end

if game.who_won == 'draw'
  puts "It's a draw"
else
  puts "Congratulations!   \
        The winner is #{game.winner} !"
end
