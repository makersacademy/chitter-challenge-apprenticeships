require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Heya wuu2?');")
      connection.exec("INSERT INTO peeps (message) VALUES('Gr8 party last night');")
      connection.exec("INSERT INTO peeps (message) VALUES('Lol');")

      messages = Message.all

      expect(messages).to include("Heya wuu2?")
      expect(messages).to include("Gr8 party last night")
      expect(messages).to include("Lol")
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create(message: 'Example text')
      expect(Message.all).to include 'Example text'
    end
  end
end