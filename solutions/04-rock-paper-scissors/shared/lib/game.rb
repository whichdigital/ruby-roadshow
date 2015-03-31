class Game

  attr_reader :rounds, :player_1, :player_2


  def self.set_players(player_1, player_2)
    new(player_1, player_2)
  end

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @rounds = 100
  end

end