require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Yesterday you said tomorrow. Just do it")
      expect(peeps).to include("It always seems impossible until it is done")
    end
  end
end
