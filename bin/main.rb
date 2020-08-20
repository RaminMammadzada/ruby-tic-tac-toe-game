#!/usr/bin/env ruby
require '../lib/player'
require '../lib/game'

puts 'Please enter player1 name: '
player_1_name = gets.chomp
player1 = Player.new(player_1_name)

puts 'Please enter player2 name: '
player_2_name = gets.chomp
player2 = Player.new(player_2_name)

game = Game.new(player1, player2)

puts "Welcome to the Tic - Tac - Toe game #{player1.name} and #{player2.name}"

4.times do
  puts "It is #{player1.name}'s turn to play now."
  puts "#{player1.name}, please enter location(1-9) to puts x there!"
  player1_move = gets.chomp
  game.update_board(player1_move, player1)
  game.print_board

  puts ''

  puts "It is #{player2.name}'s turn to play now."
  puts "#{player2.name}, please enter location(1-9) to puts x there!"
  player2_move = gets.chomp
  game.update_board(player2_move, player2)
  game.print_board
end

puts ''

puts "Congrats! #{player1.name} is a winner! "
