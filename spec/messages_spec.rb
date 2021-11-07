require 'messages'

describe Messages do
  describe '.all' do
    it 'return all peeps' do
      peeps = Messages.all

      expect(peeps).to include('This is a peep!')
      # expect(peeps).to include('This is another peep!')
    end
  end
end