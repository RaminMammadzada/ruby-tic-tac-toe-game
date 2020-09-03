require './lib/player'

describe Player do
  describe "#initialize" do
    let(:player1){ Player.new("Ramin", 'x')}
    it "return the player's name" do
      expect(player1.name).to eql("Ramin")
    end

    it "return the player's tag" do
      expect(player1.tag).to eql("x")
    end

    it "return if the player is winner or not" do
      expect(player1.is_winner).to eql(false)
    end

    it "return name modified " do
      player1.name = "Youcef"
      expect(player1.name).to eql("Youcef")
    end

    it "return the player's modified tag " do
      player1.tag = "o"
      expect(player1.tag).to eql("o")
    end

    it "return if the player is winner or not modified" do
      player1.is_winner = true
      expect(player1.is_winner).to eql(true)
    end

  end
end