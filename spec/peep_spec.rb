require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("Meditate to evolve.")
      expect(peeps).to include("Stay in the present moment.")
      expect(peeps).to include("Being of service to others is what brings true happiness.")
    end
  end
end
