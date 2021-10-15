require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include ("Message 1 from user 1")
      expect(messages).to include ("Message 2 from user 2")
      expect(messages).to include ("Message 3 from user 3")
    end
  end
end