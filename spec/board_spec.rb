require './lib/board'
require './lib/player'

describe Board do
  let(:player1) { Player.new('Youcef', 'o') }
  let(:player2) { Player.new('Ramin', 'x') }
  let(:board) { Board.new(:player1, :player2) }

  describe '#initialize' do
    it 'creates a board instance' do
      expect(board).to be_an_instance_of Board
    end

    it 'read the instance variable @board successfully' do
      expect(board.board).to eql({ '1' => ' ', '2' => ' ', '3' => ' ',
                                   '4' => ' ', '5' => ' ', '6' => ' ',
                                   '7' => ' ', '8' => ' ', '9' => ' ' })
    end

    # it "return name modified " do
    #   expect(board.player1).to eql(:player1)
    # end
  end

  describe '#create_line_in_board' do
    it 'prints one line of board with input 0 ' do
      expect { board.create_line_in_board(0) }.to output(' | | ').to_stdout
    end

    it 'prints one line of board with input 3 ' do
      expect { board.create_line_in_board(3) }.to output(' | | ').to_stdout
    end

    it 'prints one line of board with input 6 ' do
      expect { board.create_line_in_board(6) }.to output(' | | ').to_stdout
    end

    it 'prints the 1st line of board after modification ' do
      board.board['1'] = 'x'
      expect { board.create_line_in_board(0) }.to output('x| | ').to_stdout
    end

    it 'prints the 2nd line of board after modification ' do
      board.board['5'] = 'x'
      expect { board.create_line_in_board(3) }.to output(' |x| ').to_stdout
    end

    it 'prints the 3rd line of board after modification ' do
      board.board['9'] = 'o'
      expect { board.create_line_in_board(6) }.to output(' | |o').to_stdout
    end
  end

  describe '#print_board' do
    it 'print all the board' do
      expect { board.print_board }.to output(" | | \n-+-+-\n | | \n-+-+-\n | | \n").to_stdout
    end

    it 'print all the board after modification' do
      board.board['2'] = 'o'
      board.board['6'] = 'x'
      expect { board.print_board }.to output(" |o| \n-+-+-\n | |x\n-+-+-\n | | \n").to_stdout
    end
  end

  describe '#update_board' do
    it 'update a board after modification' do
      board.update_board('2', player1.name)
      expect { board.print_board }.to output(" |#{player1.tag}| \n-+-+-\n | | \n-+-+-\n | | \n").to_stdout
      # expect(board.player2.name).to eql('zoro')
    end
  end

  describe '#blank?' do
    it 'return true if a cell is blank' do
      expect(board.blank?('1')).to eql(true)
    end

    it 'return false if a cell is not blank' do
      board.board['1'] = 'x'
      expect(board.blank?('1')).to eql(false)
    end
  end

  describe '#any_empty?' do
    it 'return true if there is at least one empty cell' do
      expect(board.any_empty?).to eql(true)
    end

    it 'return false if there no empty cell' do
      board.board['1'] = 'x'
      board.board['2'] = 'x'
      board.board['3'] = 'x'
      board.board['4'] = 'x'
      board.board['5'] = 'x'
      board.board['6'] = 'x'
      board.board['7'] = 'x'
      board.board['8'] = 'x'
      board.board['9'] = 'x'
      expect(board.any_empty?).to eql(false)
    end
  end
end
