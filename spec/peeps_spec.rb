require './lib/peeps'

describe Peeps do
  it 'should return a list of peeps' do
    peeps = Peeps.all

    expect(peeps).to include('This is a peep!')
  end
end