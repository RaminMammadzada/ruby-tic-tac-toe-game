# This is a helper class to run helper methods
# This is a class which all of the methods about user interface will be in
class Helper
  def initialize; end

  def self.validate_player_name(player_1_name, player_2_name = 'not set')
    return player_1_name if player_2_name == 'not set'

    until player_2_name != player_1_name
      puts 'Be careful! Player 2 name must be different that Player 1 name'
      player_2_name = gets.chomp
    end
    player_2_name
  end

  def self.character_only(name)
    until name.match?(/[A-Za-z]/) != false
      puts 'Please enter at least one character for player name!'
      name = gets.chomp
    end
    name
  end
end
