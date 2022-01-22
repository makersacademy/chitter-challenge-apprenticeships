require 'message'

describe Message do
  describe '.all' do
    it 'returns message' do
      Message.create(message: 'This is the a message')

      message = Message.all

      expect(message.first).to be_a Message
      expect(message.first.message).to eq ('This is the a message')

    end
  end

  describe '.create' do
    it 'creates new message' do
      Message.create(message: 'This is the a message')

      message = Message.all

      expect(message.first).to be_a Message
      expect(message.first.message).to eq ('This is the a message')
    end
  end

  describe '.sort' do
    it 'Sorts messages by date' do
      Message.create(message: 'first message')
      Message.create(message: 'second message')
      Message.create(message: 'third message')

      message = Message.sort

      expect(message.first.message).to eq ('third message')
      expect(message.last.message).to eq ('first message')
    end
  end

  describe '.search' do
    it 'Sorts messages by date' do
      Message.create(message: 'first message')
      Message.create(message: 'second message')
      Message.create(message: 'third message')

      message = Message.search(search: 'second')

      expect(message.first.message).to eq ('second message')
    end
  end

end
