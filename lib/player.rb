# This a player class to save properties and capabilities of player

class Player
  attr_accessor :name, :tag, :is_winner
  def initialize(name, tag)
    @name = name
    @tag = tag
    @is_winner = false
  end
end
