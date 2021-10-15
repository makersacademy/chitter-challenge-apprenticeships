require 'poop'

describe '#all' do
  it 'returns all poops' do
    poops = Poop.all
    expect(poops[0][:message]).to eq("This is a poop!")
  end
end

describe '#create' do
  it 'creates a new poop in the database' do
    Poop.create("This is a new poop!")
    poops = Poop.all
    expect(poops[1][:message]).to eq("This is a new poop!")
  end

  it 'records the date the poop was created' do
    Poop.create("This is a new poop!")
    poops = Poop.all
    expect(poops[1][:created_at]).to be_a(Time)
  end
end