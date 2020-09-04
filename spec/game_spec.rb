require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

describe Game do
  let(:player1) { Player.new('Youcef', 'o') }
  let(:player2) { Player.new('Ramin', 'x') }
  let(:game) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'should have board instance variable' do
      expect(game.board).to be_an_instance_of Board
    end

    it 'should have winner instance variable' do
      expect(game.winner).to eql ''
    end
  end

  describe '#input_is_valid?' do
    it 'should return false when the input is string version of negative integer' do
      expect(game.send(:input_is_valid?, '-9')).to eql(false)
    end

    it 'should return false when the input is string version of integer that is greater than 9' do
      expect(game.send(:input_is_valid?, '12')).to eql(false)
    end

    it 'should return true when the input is string version of integer between 1-9 and the input location is empty' do
      expect(game.send(:input_is_valid?, '4')).to eql(true)
    end

    it 'should return false when the input location is occupied' do
      game.board.board['3'] = 'o'
      expect(game.send(:input_is_valid?, '3')).to eql(false)
    end
  end

  describe '#any_empty?' do
    it 'should return true if at least one cell in the board is empty' do
      expect(game.send(:any_empty?)).to eql(true)
    end

    it 'should return false if there is no empty cell' do
      game.board.board['1'] = 'x'
      game.board.board['2'] = 'x'
      game.board.board['3'] = 'x'
      game.board.board['4'] = 'x'
      game.board.board['5'] = 'x'
      game.board.board['6'] = 'x'
      game.board.board['7'] = 'x'
      game.board.board['8'] = 'x'
      game.board.board['9'] = 'x'
      expect(game.send(:any_empty?)).to eql(false)
    end
  end

  describe '#control_lines_for_player' do
    it 'should make the attribut is_winner of player2 to true' do
      game.send(:control_lines_for_player, %w[x x x], %w[x o o], [' ', 'o', ' '], player2)
      expect(player2.is_winner).to eql(true)
    end

    it 'should keep the attribut is_winner of player1 to false' do
      game.send(:control_lines_for_player, %w[x x x], %w[x o o], [' ', 'o', ' '], player1)
      expect(player1.is_winner).to eql(false)
    end
  end

  describe '#check_horizontal' do
    # check rows
    it 'should make the attribute is_winner of player2 to true' do
      game.board.board['1'] = player2.tag
      game.board.board['2'] = player2.tag
      game.board.board['3'] = player2.tag
      game.send(:check_horizontal)
      expect(player2.is_winner).to eql(true)
    end

    it 'should make the attribute is_winner of player1 to true' do
      game.board.board['1'] = player1.tag
      game.board.board['2'] = player1.tag
      game.board.board['3'] = player1.tag
      game.send(:check_horizontal)
      expect(player1.is_winner).to eql(true)
    end

    it 'should keep the attribute is_winner of player1 to false' do
      game.board.board['1'] = player1.tag
      game.board.board['2'] = player2.tag
      game.board.board['3'] = player1.tag
      game.send(:check_horizontal)
      expect(player1.is_winner).to eql(false)
    end
  end

  describe '#check_vertical' do
    # check columns
    it 'should make the attribute is_winner of player2 to true' do
      game.board.board['1'] = player2.tag
      game.board.board['4'] = player2.tag
      game.board.board['7'] = player2.tag
      game.send(:check_vertical)
      expect(player2.is_winner).to eql(true)
    end

    it 'should make the attribute is_winner of player1 to true' do
      game.board.board['1'] = player1.tag
      game.board.board['4'] = player1.tag
      game.board.board['7'] = player1.tag
      game.send(:check_vertical)
      expect(player1.is_winner).to eql(true)
    end

    it 'should keep the attribute is_winner of player1 to false' do
      game.board.board['1'] = player2.tag
      game.board.board['4'] = player1.tag
      game.board.board['7'] = player2.tag
      game.send(:check_vertical)
      expect(player1.is_winner).to eql(false)
    end
  end

  describe '#check_diagonal' do
    # chech the diagonals
    it 'should make the attribute is_winner of player1 to true for 1st diagonal' do
      game.board.board['1'] = player1.tag
      game.board.board['5'] = player1.tag
      game.board.board['9'] = player1.tag
      game.send(:check_diagonal)
      expect(player1.is_winner).to eql(true)
    end

    it 'should make the attribute is_winner of player1 to true for 2nd diagonal' do
      game.board.board['3'] = player1.tag
      game.board.board['5'] = player1.tag
      game.board.board['7'] = player1.tag
      game.send(:check_diagonal)
      expect(player1.is_winner).to eql(true)
    end
  end

  describe '#who_won' do
    # check for winner
    it 'should output draw when no one win the until the all boxes are full in the board' do
      game.board.board['1'] = player2.tag
      game.board.board['2'] = player1.tag
      game.board.board['3'] = player2.tag
      game.board.board['4'] = player2.tag
      game.board.board['5'] = player1.tag
      game.board.board['6'] = player1.tag
      game.board.board['7'] = player1.tag
      game.board.board['8'] = player2.tag
      game.board.board['9'] = player1.tag

      game.who_won
      expect(game.who_won).to eql('draw')
    end

    it 'should output winner name when there is a winner, in this case player2 name' do
      game.board.board['1'] = player1.tag
      game.board.board['3'] = player2.tag
      game.board.board['4'] = player1.tag
      game.board.board['5'] = player2.tag
      game.board.board['7'] = player2.tag

      game.who_won
      expect(game.who_won).to eql(player2.name)
    end

    it 'should output empty string when the game is still going on, neither winner and nor draw situation' do
      game.board.board['1'] = player1.tag
      game.board.board['4'] = player1.tag
      game.board.board['5'] = player2.tag
      game.board.board['7'] = player2.tag

      game.who_won
      expect(game.who_won).to eql('')
    end
  end
end
