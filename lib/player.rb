# frozen_string_literal: true

# This a player class to save properties and capabilities of player
class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end
