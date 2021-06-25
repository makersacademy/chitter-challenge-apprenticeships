require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("This is message 1.")
      expect(peeps).to include("This is message 2.")
      expect(peeps).to include("This is message 3.")
    end

  end

end