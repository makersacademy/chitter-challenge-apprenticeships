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
      
      expect(messages).to include "Today's first peep"
      expect(messages).to include "Today's second peep"
      expect(messages).to include "Today's third peep"
    end
  end
end