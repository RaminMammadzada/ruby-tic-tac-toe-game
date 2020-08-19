def print_board(board)
    print board['1'] + "|" + board['2']+ "|" + board['3']
    puts
    puts"--+-+--"
    print board['4'] + "|" + board['5']+ "|" + board['6']
    puts
    puts"--+-+--"
    print board['7'] + "|" + board['8']+ "|" + board['9']
 end

puts "Please enter player1 name: "
player_1 = gets.chomp
puts "#{player_1}"

puts "Please enter player2 name: "
player_2 = gets.chomp
puts "#{player_2}"

game_board = {'1' => ' ', '2' => ' ', '3'=> ' ',
              '4' => ' ', '5' => ' ', '6'=> ' ',
              '7' => ' ', '8' => ' ', '9'=> ' '
              }

puts "Player1 please enter location(1-9) to puts x there!"
player1_move = gets.chomp
game_board[player1_move] = 'x'
print_board(game_board)

puts "Player2 please enter location(1-9) to puts o there!"
player2_move = gets.chomp
game_board[player2_move] = 'o'
print_board(game_board)
