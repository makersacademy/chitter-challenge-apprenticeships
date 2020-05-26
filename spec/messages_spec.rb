require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all the messages' do
      connection = PG.connect(dbname: 'chitter_test')

      #don't forget to add test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is another peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('More peeping!');")

      messages = Messages.all

      expect(messages).to include('This is a peep!')
      expect(messages).to include('This is another peep!')
      expect(messages).to include('More peeping!')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Messages.create(message: 'Test peep!', date_posted: '#{date_posted}')

      expect(Messages.all).to include('Test peep!')
    end
  end
end
