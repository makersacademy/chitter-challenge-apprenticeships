require 'peep'

describe Peep do
  
  describe '#self.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include "This is a peep!"
      expect(peeps).to include "And this is a peep!"
      expect(peeps).to include "And this is a peep too!"
    end
  end
end