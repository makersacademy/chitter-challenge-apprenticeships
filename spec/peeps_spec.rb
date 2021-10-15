require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns al list of peeps messages' do
      peeps = Peeps.all

      expect(peeps).to include("peep1")
      expect(peeps).to include("peep2")
      expect(peeps).to include("peep3")
    end
  end
end