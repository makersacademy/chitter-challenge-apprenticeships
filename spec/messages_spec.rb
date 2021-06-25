require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO peeps (message) VALUES ('Hello, first message!');")
        connection.exec("INSERT INTO peeps (message) VALUES('It is raining!');")
        connection.exec("INSERT INTO peeps (message) VALUES('Today is Friday!');")
        
        messages = Message.all

        expect(messages).to include("Hello, first message!")
        expect(messages).to include("It is raining!")
        expect(messages).to include("Today is Friday!")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Message.create(message: 'It is the weekend!')
  
      expect(Message.all).to include "It is the weekend!"
    end
  end
end