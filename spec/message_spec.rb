require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO peeps (message) VALUES ('I am a frog');")
      messages = Message.all

      expect(messages).to include("I am a frog")
    end
  end

  describe '.add' do
    it 'creates new message' do
        message = Message.add(message: 'I am so happy!').first
    # Message.add(message: 'I am so happy')
    expect(Message.all).to include 'I am so happy!'
    end
  end
end