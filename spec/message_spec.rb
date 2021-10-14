require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps VALUES(1, 'Hi Michelle! How are you?');")
      connection.exec("INSERT INTO peeps VALUES(2, 'What time is the theatre show?');")

      messages = Message.all

      expect(peeps).to include('Hi Michelle! How are you?')
      expect(peeps).to include('What time is the theatre show?')
    end
  end
end
