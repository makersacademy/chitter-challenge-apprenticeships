require 'peep'

RSpec.describe Peep do
  describe '#all' do
    it 'returns a list of all peeps' do
      expect(Peep.all).to eq [ { message: 'I just bought a cabbage' },
                               { message: 'Eggs are so weird am I right?' } ]
    end
  end
end
