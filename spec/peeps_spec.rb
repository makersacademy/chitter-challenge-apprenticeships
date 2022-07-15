require 'Peeps'

describe Peeps do
  describe '.all' do
    it 'returns all chitter posts' do
      peeps = Peeps.all
      expect(peeps).to include("This is a peep!")
    end
  end
end