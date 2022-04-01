require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Hello world!")
      expect(peeps).to include("Hi Chitter! This is my first peep!")
      expect(peeps).to include("This is a peep!")
    end
  end
end