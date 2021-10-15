require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('message 1')
      expect(peeps).to include('message 2')
      expect(peeps).to include('message 3')
    end
  end
end