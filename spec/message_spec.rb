require 'message'

describe 'Message' do
  describe'.all' do
    it 'stores the messages' do
      connection = PG.connect(dbname: 'chitter_test')

      #add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Today''s first peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Today''s second peep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Today''s third peep');")

      messages = Message.all 
      list_of_messages = messages.map { |item| item.message }

      expect(list_of_messages).to eq ["Today's first peep","Today's second peep","Today's third peep"]
    end
  end

  describe '.create' do
    it 'creates a new message' do
      some_message = 'This is a new message'    
      test_message = Message.create(some_message)
      
      messages = Message.all 
      list_of_messages = messages.map { |item| item.message }
  
      expect(list_of_messages).to include some_message
    end
  end
end