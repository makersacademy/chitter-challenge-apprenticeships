require 'setup_test_database'
require 'database_helpers'
require 'message'

describe Message do
  describe '#all' do
    it 'will list all of the messages in the database' do
      connection = PG.connect(dbname: 'chitter_test')
      Message.add(message: 'This is a peep!', date: '23rd May')
      Message.add(message: 'This is another peep!', date: '24th May')
      Message.add(message: 'A third peep!', date: '25th May')
      messages = Message.all
      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.message).to eq 'This is a peep!'
      expect(messages.first.date).to eq '23rd May'
      # Connects to test database, adds message and date values, calls .all method and expect database to contain added test data
    end
  end

  describe '#add' do
    it 'will add a message into the database' do
      message = Message.add(message: 'A third peep!', date: '25th May')
      persisted_data = persisted_data(id: message.id)
      #persisted_data connects to test database
      expect(message).to be_a Message
      expect(message.id).to eq persisted_data['id']
      expect(message.date).to eq('25th May')
      expect(message.message).to eq('A third peep!')
      # Connects to test database, using persisted data method in 'database_helpers', expects the test data added
    end 
  end
end
