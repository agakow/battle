class Game

  attr_reader :player_1, :player_2, :players, :current_player

  def initialize(player_1_name, player_2_name)
    @player_1 = Player.new(player_1_name)
    @player_2 = Player.new(player_2_name)
    @players = [@player_2, @player_1]
  end

  def current_player
    @players.last
  end

  # def computer?
  #   @player_2.name == 'computer'
  # end

  def attack
    @players.first.receive_damage
  end

  def switch_turn
    @players.reverse!
  end

  def loser?
    @players.first.hit_points <= 0
  end

  def self.instance
    @game
  end

  def self.create(player_1_name, player_2_name)
    @game = Game.new(player_1_name, player_2_name)
  end

end
