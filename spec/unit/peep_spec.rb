require 'peep'

describe '.create' do
  it 'creates a new bookmark' do
    peep = Peep.new

    expect(peep.create).to eq 'A new peep'
  end
end
