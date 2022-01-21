require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all
      expect(messages).to include('Hi there')
      expect(messages).to include('How are you today?')
    end
  end
end