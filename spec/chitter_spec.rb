require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns a list of messages' do
      peeps = Peeps.all

      expect(peeps).to include('This is a peep!')
    end
  end
end