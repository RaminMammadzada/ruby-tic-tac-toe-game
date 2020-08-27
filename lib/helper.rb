# This is a helper class to run helper methods
# This is a class which all of the methods about user interface will be in
class Helper
  def initialize()
  end

  def self.include_character?(str)
    result = str.match(/[a-zA-Z_]/)
    puts result.captures
    result.captures.nil? == "" ? false : true
  end

  def self.validate_player_name(player_1_name, player_2_name = "not set")
    if player_2_name == "not set"
      until include_character?(player_1_name)
        puts 'Player name must accept at least one character!'
        player_1_name = gets.chomp
      end
      return player_1_name
    end

    until player_2_name != player_1_name && include_character?(player_2_name)
      puts 'Be careful! Player 2 name must be different that Player 1 name and must include at least 1 character'
      player_2_name = gets.chomp
    end
    return player_2_name
  end
end
