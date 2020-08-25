require_relative  '../lib/Player'
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
  puts "It is #{player1.name}'s turn to play now."
  puts "#{player1.name}, please enter location(1-9) to puts x there!"

  while true
    player1_move = gets.chomp

    if game.input_is_valid?(player1_move)
      if game.is_blank?(player1_move)
        break
      else
        puts 'That location is full, please enter the blank location!'
      end
    else
      puts 'Please enter the valid number as explained above!'
    end
  end

  game.update_board(player1_move, player1)
  game.print_board
  puts 
  if !game.is_any_empty?
    puts "It's draw!"
    break
  end

  puts ''
  puts '- - - - - - - -'


  puts "It is #{player2.name}'s turn to play now."
  puts "#{player2.name}, please enter location(1-9) to puts x there!"

  while true
    player2_move = gets.chomp

    if game.input_is_valid?(player2_move)
      if game.is_blank?(player2_move)
        break
      else
        puts 'That location is full, please enter the blank location!'
      end
    else
      puts 'Please enter the valid number as explained above!'
    end
  end

  game.update_board(player2_move, player2)
  game.print_board
  puts ''
  if !game.is_any_empty?
    puts "It's draw!"
    break
  end
end