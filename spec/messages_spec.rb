require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all messages' do
      messages = Messages.all
      expect(messages).to include("This is a peep!")
      expect(messages).to include("This is also a peep!")
    end
  end
end
