require 'peep'

describe Peep do
  describe '.all' do
    it 'shows all peeps' do
      peeps = Peep.all
      expect(peeps).to include("This is a peep!")
      # expect(peeps).to include("This is another peep!")
    end
  end
end
