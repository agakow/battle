require 'game'

describe Game do
  let(:player_1){double :player_1}
  let(:player_2){double :player_2}

  subject(:game) { described_class.new(player_1, player_2) }

  # it 'damages the player' do
  #   expect(player_2).to receive(:receive_damage)
  #   game.attack
  # end

  it 'create two player instances' do
    expect(game.player_2).to be_an_instance_of(Player)
    expect(game.player_1).to be_an_instance_of(Player)
  end

end
