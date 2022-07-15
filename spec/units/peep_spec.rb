require 'peep'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("This is also a peep!")
      expect(peeps).to include("This is a third peep!")
    end
  end
end
