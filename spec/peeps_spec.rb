require 'peeps'

describe Peeps do
  describe '.all' do
    it 'gives us all the peeps' do
      peeps = Peeps.all
      expect(peeps).to include('I am a peep!')
      expect(peeps).to include('I am another peep!')
    end
  end
end
