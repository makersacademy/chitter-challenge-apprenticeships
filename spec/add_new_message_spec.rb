require 'message'

describe 'Add new message' do
  describe '.create' do
    it 'creates a new message' do
      connection = PG.connect(dbname: 'chitter')

      test_message = Message.create('This is a new message')

      expect(Message.all).to include 'This is a new message'
    end
  end
end
