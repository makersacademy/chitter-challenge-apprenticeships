require 'poop'

describe '#all' do
  it 'returns all poops' do
    poops = Poop.all
    expect(poops[0]).to eq("This is a poop!")
  end
end

describe '#create' do
  it 'creates a new poop in the database' do
    Poop.create("This is a new poop!")
    poops = Poop.all
    expect(poops[1]).to eq("This is a new poop!")
  end
end