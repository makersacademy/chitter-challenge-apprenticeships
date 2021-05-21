require 'peeps'

describe Peep do
  describe '.all' do
    it 'returns all posts/peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
    end
  end
end
