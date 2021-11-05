require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all
      expect(messages).to include("This is a peep!")
      expect(messages).to include("I am a frog")
    end
  end
end