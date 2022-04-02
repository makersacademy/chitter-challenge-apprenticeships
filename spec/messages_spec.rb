require 'messages'
require 'pg'

describe Messages do 
  describe '.all' do
    it 'returns a list of messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
      connection.exec("INSERT INTO peeps (message) VALUES('Hi!');")
      connection.exec("INSERT INTO peeps (message) VALUES('Hiya.');")
      
      messages = Messages.all
  
      expect(messages.length).to eq 3
      expect(messages).to include "Hello"
      expect(messages).to include "Hi!"
      expect(messages).to include "Hiya."
    end
  end
end 
