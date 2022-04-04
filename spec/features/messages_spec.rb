require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all the peeps' do
      peeps = Messages.all

      expect(peeps).to include("This is a message")
      expect(peeps).to include("this is also another message")
      expect(peeps).to include("I'm learning ruby")
    end
  end
end