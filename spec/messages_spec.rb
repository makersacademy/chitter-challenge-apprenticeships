require 'message'

describe Message do
  describe '.all' do
    it 'return all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

      peeps = Message.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('This is another peep!')
    end
  end

  describe '.create' do
    it 'creates a new message' do
      Message.create(message: "This is a new peep!")
      
      expect(Message.all).to include('This is a new peep!')
    end
  end
end