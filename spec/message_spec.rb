require 'setup_test_database'
require 'message'

describe Message do
  describe '#all' do
    it 'will list all of the messages in the database' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep!');")
      message = Message.all
      expect(message).to include("This is a peep!")
      expect(message).to include("This is another peep!")
    end
  end
end
