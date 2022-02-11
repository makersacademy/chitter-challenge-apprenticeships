require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("I've got blisters on me fingers!")
      expect(peeps).to include("Oh, dress yourself, my urchin one, for I hear them on the rails")
      expect(peeps).to include("This is a peep!")
    end
  end
end
