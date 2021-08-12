require 'messages'

describe Messages do

  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
      connection.exec("INSERT INTO peeps (message) VALUES ('World');")

      messages = Messages.all

      expect(messages).to include('This is a peep!')
      expect(messages).to include('Hello')
      expect(messages).to include('World')
    end
  end
end 