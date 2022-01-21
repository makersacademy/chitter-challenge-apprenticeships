require 'peep'

describe Peep do
  it 'views all peeps' do
    peeps = Peep.all
    expect(peeps).to include('This is a peep!')
  end
end
