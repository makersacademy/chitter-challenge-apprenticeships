require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("Welcome to Chitter!")
      expect(peeps).to include("My first peep!")
    end

  end

end