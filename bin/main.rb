require_relative '../lib/player'
require_relative '../lib/game'

puts 'Please enter player1 name: '
player_1_name = gets.chomp
player1 = Player.new(player_1_name, 'x')

puts 'Please enter player2 name: '
player_2_name = gets.chomp
player2 = Player.new(player_2_name, 'o')

game = Game.new(player1, player2)

puts "Welcome to the Tic - Tac - Toe game #{player1.name} and #{player2.name}"

loop do
  game.move(player1)
  break if game.who_won != ''

  puts ''
  puts '- - - - - - - -'

  # if you want to say make player1 win, uncomment the following line
  # @player1.is_winner = true

  # if you want to say make player2 win, uncomment the following line
  # @player2.is_winner = false

  # otherwise it will say "It is draw" after leaving the loop

  game.move(player2)
  break if game.who_won != ''
end

if game.who_won == 'draw'
  puts "It's a draw"
else
  puts "Congratulations!   \
        The winner is #{player1.is_winner ? player1.name : player2.name} !"
end
