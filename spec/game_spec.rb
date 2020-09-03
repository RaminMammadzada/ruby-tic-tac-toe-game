require './lib/game'
require './lib/player'
require './lib/board'

describe Game do
  let(:player1) {Player.new("Youcef", 'o')}
  let(:player2) {Player.new("Ramin", 'x')}
  let(:game) {Game.new(:player1, :player2)}

  describe "#initialize" do
    it 'should have board instance variable' do
      expect(game.board).to be_an_instance_of Board
    end

    it 'should have winner instance variable' do
      expect(game.winner).to eql ''
    end
  end

  describe "#input_is_valid?" do
    it 'should return false when the input is string version of negative integer' do
      expect(game.send(:input_is_valid?, "-9")).to eql( false )
    end

    it 'should return false when the input is string version of integer that is greater than 9' do
      expect(game.send(:input_is_valid?, "12")).to eql( false )
    end

    it 'should return true when the input is string version of integer between 1 and 9' do
      expect(game.send(:input_is_valid?, "4")).to eql(true)
    end

    it 'should return false when the input location is occupied' do
      game.board.board['3'] = 'o'
      expect(game.send(:input_is_valid?, "3")).to eql( false )
    end

    it 'should return true when the input location is empty' do
      expect(game.send(:input_is_valid?, "9")).to eql( true )
    end

  end

  describe "#any_empty?" do

  end

  describe "#move" do

  end

  describe "#who_won" do

  end

  describe "#control_lines_for_player" do

  end

  describe "#check_horizontal" do

  end

  describe "#check_vertical" do

  end

  describe "#check_diagonal" do

  end

end