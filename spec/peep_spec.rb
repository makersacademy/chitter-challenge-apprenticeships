require 'peep'

describe Peep do
  it 'returns all peeps' do
    peeps = Peep.all

    expect(peeps).to include("This is a peep!")
  end
end