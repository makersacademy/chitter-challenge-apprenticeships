require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all
      expect(messages).to include("Hi Michelle! How are you?")
    end
  end
end
