require 'peep'

describe Peep do
  describe '.see_peeps' do
    it 'returns all peeps' do
      peeps = Peep.see_peeps

      expect(peeps).to include('This is a peep!')
    end
  end
end