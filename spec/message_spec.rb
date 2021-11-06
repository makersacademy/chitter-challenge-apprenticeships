require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all
      expect(messages).to include("This is a peep!")
      expect(messages).to include("I am a frog")
    end
  end

  describe '.add' do
    it 'creates new message' do
    message = Message.add(message: 'I am so happy')
    expect(Message.all).to include 'I am so happy'
    end
  end
end