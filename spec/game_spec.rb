require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

describe Board do
  describe '#initialize' do
    it "intitialize instance variables" do
      @board = {'1' => ' ', '2' => ' ', '3' => ' ',
               '4' => ' ', '5' => ' ', '6' => ' ',
               '7' => ' ', '8' => ' ', '9' => ' '}
    end
  end
  let(:player1) {Player.new('sajjad', 'x')}
  let(:player2) {Player.new('ahmad', 'o')}
  let(:board) {Board.new(player1, player2)}
  describe '#update_board' do
    it "update the board with x for player1 and o for player2" do
      expect(board.update_board('1', player1)).to eql('x')
      expect(board.update_board('2', player2)).to eql('o')
    end
  end
  describe '#create_line_in_board' do
    it "print an empty line on board when 0 is passed as argument" do
      expect{board.create_line_in_board(0)}.to output(' | | ').to_stdout
    end
    it "print an empty line on board when 0 is passed as argument" do
      expect{board.create_line_in_board(3)}.to output(' | | ').to_stdout
    end
    it "print an empty line on board when 0 is passed as argument" do
      expect{board.create_line_in_board(6)}.to output(' | | ').to_stdout
    end
    it "print x in location 1 when 0 is passed as argument" do
      board.board['1'] = 'x'
      expect{board.create_line_in_board(0)}.to output('x| | ').to_stdout
    end
  end

  describe '#blank?' do
    it "return false if a location on board is not empty" do
      board.board['2'] = 'o'
      expect(board.blank?('2')).to eql(false)
    end
    it "return true if a location on board is empty" do
      board.board['2'] = ' '
      expect(board.blank?('2')).to eql(true)
    end
  end
end