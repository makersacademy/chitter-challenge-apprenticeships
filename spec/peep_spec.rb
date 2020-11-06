require 'peep'

RSpec.describe Peep do
  it 'returns peeps from database' do
    peeps = Peep.all
    expect(peeps).to include 'This is a peep!'
  end
end
