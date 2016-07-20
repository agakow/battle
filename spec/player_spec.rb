require 'player'

describe Player do
  let(:name){double :name}
  subject{described_class.new(name)}

  it 'returns player name' do
    expect(subject.name).to eq name
  end
end
