require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.all

      expect(peep).to include("This is a peep!")
    end
  end
end