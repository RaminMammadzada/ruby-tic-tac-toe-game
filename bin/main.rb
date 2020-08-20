#!/usr/bin/env ruby
require '../lib/Player'
require '../lib/Game'

puts "Please enter player1 name: "
player_1_name = gets.chomp
player_1 = Player.new(player_1_name)


puts "Please enter player2 name: "
player_2_name = gets.chomp
player_2 = Player.new(player_2_name)

game = Game.new(player_1, player_2)

puts "Welcome to the Tic - Tac - Toe game #{player_1.name} and #{player_2.name}"

puts"It is #{player_1.name}'s turn to play now."
puts "#{player_1.name}, please enter location(1-9) to puts x there!"
player1_move = gets.chomp
game.update_board(player1_move, player_1)
game.print_board()

puts

puts"It is #{player_2.name}'s turn to play now."
puts "#{player_2.name}, please enter location(1-9) to puts x there!"
player2_move = gets.chomp
game.update_board(player2_move, player_2)
game.print_board()
