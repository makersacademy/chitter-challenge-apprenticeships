require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include("Test Message 1")
      expect(messages).to include("Test Message 2")
    end
  end
end