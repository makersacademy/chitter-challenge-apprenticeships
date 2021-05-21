require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all the messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Hi there Paul hows the family?');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Hey Ryan yeah the family are doing well thanks');")

      messages = Messages.all
      expect(messages).to include('Hi there Paul hows the family?')
      expect(messages).to include('Hey Ryan yeah the family are doing well thanks')
    end
  end

  describe '.add' do
    it 'adds a new message' do
      Messages.add(message: 'Chitter is so amazing')

      expect(Messages.all).to include 'Chitter is so amazing'
    end
  end 
end