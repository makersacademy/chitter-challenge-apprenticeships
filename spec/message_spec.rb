require 'message'
require 'pg'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('Hi there');")
      connection.exec("INSERT INTO peeps (message) VALUES('How are you today?');")

      messages = Message.all

      expect(messages).to include('Hi there')
      expect(messages).to include('How are you today?')
    end
  end
  
describe '.create' do
  it 'create a new message' do
Message.create(message: 'a new post')
expect(Message.all).to include 'a new post'
end
end
end