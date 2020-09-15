require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

describe Board do
  let(:player1) {Player.new('sajjad', 'x')}
  let(:player2) {Player.new('ahmad', 'o')}
  let(:board) {Board.new(player1, player2)}
  let(:game_board) { { '1' => ' ', '2' => ' ', '3' => ' ',
        '4' => ' ', '5' => ' ', '6' => ' ',
        '7' => ' ', '8' => ' ', '9' => ' '} }
  describe '#update_board' do
    it "update the board with x for player1 and o for player2" do
      expect(board.update_board('1', player1)).to eql('x')
      expect(board.update_board('2', player2)).to eql('o')
    end
  end
  describe '#create_line_in_board' do
    it "return locations of board" do
      expect(board.create_line_in_board(0)).to eql(game_board['0 + 1'])
      expect(board.create_line_in_board(3)).to eql(game_board['3 + 1'])
      expect(board.create_line_in_board(6)).to eql(game_board['6 + 1'])
    end
  end

  describe '#blank?' do
    it "return false if a location on board is not empty" do
      full = game_board['2']
      expect(board.blank?(full)).to eql(false)
    end
  end
end