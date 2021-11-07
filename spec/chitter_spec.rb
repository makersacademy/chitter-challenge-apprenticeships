require 'chitter'

describe Chitter do
  describe '.all' do
    it 'return all peeps' do
      peeps = Chitter.all

      expect(peeps).to include('This is peep 1')
      expect(peeps).to include('This is peep 2')
    end
  end
end