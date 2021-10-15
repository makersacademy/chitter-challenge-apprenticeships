require 'poop'

describe '#all' do
  it 'returns all poops' do
    poops = Poop.all
    expect(poops[0]).to eq("This is a poop!")
  end
end