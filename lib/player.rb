# frozen_string_literal: true

# This a player class to save properties and capabilities of player
class Player
  attr_accessor :name, :tag
  def initialize(name, tag)
    @name = name
    @tag = tag
  end
end
