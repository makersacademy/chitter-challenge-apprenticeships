require 'peep'

RSpec.describe Peep do
  it 'returns peeps from database' do
    peeps = Peep.all
    expect(peeps).to include 'This is a peep!'
  end

  it 'adds new peeps to database' do
    Peep.add('My new peep.')
    peeps = Peep.all
    expect(peeps).to include 'My new peep.'
  end
end
