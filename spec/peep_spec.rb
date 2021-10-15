require 'peep'

describe Peep do
  describe '#all' do
    it 'returns empty array if have no messages' do
      expect(Peep.all).to eq []
    end
  end
end
