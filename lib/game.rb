require_relative 'player'

class Game

attr_reader :player_1, :player_2, :players, :last_attack

    def self.create(player_1, player_2)
      @game = Game.new(player_1, player_2)
    end

    def self.instance
      @game
    end

    def initialize(player_1, player_2)
      @player_1 = player_1
      @player_2 = player_2
      @players = [player_1, player_2]
      # @current_player = player_1
    end


  def attack
    @players.last.receive_damage
    return if game_over?
  end

  def computer_attack
    @last_attack = [attack ,paralyse].sample
    @last_attack
  end

  def paralyse
    switch
  end

  def switch
     @players.rotate!
  end

  # def current_player
  #    @current_player = @players.first
  # end

  def game_over?
    @players.last.hp <= 0
  end

end
