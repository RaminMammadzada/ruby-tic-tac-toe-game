# frozen_string_literal: true

require_relative '../lib/Player'
require_relative '../lib/Game'

puts 'Please enter player1 name: '
player_1_name = gets.chomp
player1 = Player.new(player_1_name)

puts 'Please enter player2 name: '
player_2_name = gets.chomp
player2 = Player.new(player_2_name)

game = Game.new(player1, player2)

puts "Welcome to the Tic - Tac - Toe game #{player1.name} and #{player2.name}"

loop do
  game.move(player1)
  unless game.any_empty?
    puts "It's draw!"
    break
  end
  puts ''
  puts '- - - - - - - -'
  game.move(player2)
  unless game.any_empty?
    puts "It's draw!"
    break
  end
end

puts 'Hello world!'
