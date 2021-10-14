require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include("Hi Michelle! How are you?")
      expect(messages).to include("What time is the theatre show tonight?")
    end
  end
end
