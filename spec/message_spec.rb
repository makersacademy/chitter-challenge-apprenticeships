require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (name, message) VALUES ('Bob', 'Test Message 1');")
      connection.exec("INSERT INTO peeps (name, message) VALUES ('Ron', 'Test Message 2');")

      messages = Message.all

      expect(messages).to include("Bob - Test Message 1")
      expect(messages).to include("Ron - Test Message 2")
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create(name: 'Jon', message: 'Test Message 4')

      expect(Message.all).to include('Jon - Test Message 4')
    end
  end
end
