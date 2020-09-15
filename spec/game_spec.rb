require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

describe Board do
  let(:player1) {Player.new('sajjad', 'x')}
  let(:player2) {Player.new('ahmad', 'o')}
  let(:board) {Board.new(player1, player2)}
  it "update the board with x for player1 and o for player2" do
    expect(board.update_board('1', player1)).to eql('x')
    expect(board.update_board('2', player2)).to eql('o')
  end
  it "print 1-9 locations of board" do
    @board = { '1' => ' ', '2' => ' ', '3' => ' ',
               '4' => ' ', '5' => ' ', '6' => ' ',
               '7' => ' ', '8' => ' ', '9' => ' ' }
    expect(board.create_line_in_board(0)).to eql(@board['0 + 1'])
    expect(board.create_line_in_board(3)).to eql(@board['3 + 1'])
    expect(board.create_line_in_board(6)).to eql(@board['6 + 1'])
  end

end