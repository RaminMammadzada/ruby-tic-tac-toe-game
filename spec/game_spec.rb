require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
describe Board do
  describe '#initialize' do
    it 'intitialize instance variables of Board' do
      @board = { '1' => ' ', '2' => ' ', '3' => ' ',
                 '4' => ' ', '5' => ' ', '6' => ' ',
                 '7' => ' ', '8' => ' ', '9' => ' ' }
    end
  end
  let(:player1) { Player.new('sajjad', 'x') }
  let(:player2) { Player.new('ahmad', 'o') }
  let(:board) { Board.new(player1, player2) }
  describe '#update_board' do
    it 'update the board with x for player1' do
      expect(board.update_board('1', player1)).to eql('x')
    end
    it 'update the board with o for player2' do
      expect(board.update_board('2', player2)).to eql('o')
    end
  end
  describe '#create_line_in_board' do
    it 'print an empty line on board when 0 is passed as argument' do
      expect { board.create_line_in_board(0) }.to output(' | | ').to_stdout
    end
    it 'print an empty line on board when 0 is passed as argument' do
      expect { board.create_line_in_board(3) }.to output(' | | ').to_stdout
    end
    it 'print an empty line on board when 0 is passed as argument' do
      expect { board.create_line_in_board(6) }.to output(' | | ').to_stdout
    end
    it 'print x in location 1 when 0 is passed as argument' do
      board.board['1'] = 'x'
      expect { board.create_line_in_board(0) }.to output('x| | ').to_stdout
    end
  end

  describe '#blank?' do
    it 'return false if a location on board is not empty' do
      board.board['2'] = 'o'
      expect(board.blank?('2')).to eql(false)
    end
    it 'return true if a location on board is empty' do
      board.board['2'] = ' '
      expect(board.blank?('2')).to eql(true)
    end
  end

  describe '#print_board' do
    it 'print an empty board' do
      expect { board.print_board }.to output(" | | \n-+-+-\n | | \n-+-+-\n | | \n").to_stdout
    end
    it 'print board with x in location 1' do
      board.board['1'] = 'x'
      expect { board.print_board }.to output("x| | \n-+-+-\n | | \n-+-+-\n | | \n").to_stdout
    end
    it 'print board with o in location 9' do
      board.board['9'] = 'o'
      expect { board.print_board }.to output(" | | \n-+-+-\n | | \n-+-+-\n | |o\n").to_stdout
    end
  end
end

describe Game do
  let(:player1) { Player.new('sajjad', 'x') }
  let(:player2) { Player.new('ahmad', 'o') }
  let(:game) { Game.new(player1, player2) }
  describe '#who_one' do
    it 'return player1 name' do
      game.board.board['1'] = 'x'
      game.board.board['2'] = 'x'
      game.board.board['3'] = 'x'
      game.who_won
      expect(game.who_won).to eql('sajjad')
    end
    it 'return player1 name' do
      game.board.board['1'] = 'o'
      game.board.board['2'] = 'o'
      game.board.board['3'] = 'o'
      game.who_won
      expect(game.who_won).to eql('ahmad')
    end
    it 'return draw' do
      game.board.board['1'] = 'x'
      game.board.board['2'] = 'o'
      game.board.board['3'] = 'x'
      game.board.board['4'] = 'o'
      game.board.board['5'] = 'o'
      game.board.board['6'] = 'x'
      game.board.board['7'] = 'x'
      game.board.board['8'] = 'x'
      game.board.board['9'] = 'o'
      game.who_won
      expect(game.who_won).to eql('draw')
    end
    it 'return draw' do
      game.board.board['1'] = 'x'
      game.board.board['2'] = 'o'
      game.board.board['3'] = 'x'
      game.who_won
      expect(game.who_won).to eql('')
    end
  end
end
