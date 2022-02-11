require 'messages'

describe Messages do
  describe '.all' do
    it 'shows all messages' do
      # connect to database
      connection = PG.connect(dbname: 'chitter_test')
      # add some data for testing
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('and another peep');")

      messages = Messages.all

      expect(messages).to include("This is a peep!")
      expect(messages).to include("and another peep")
    end
  end
end
