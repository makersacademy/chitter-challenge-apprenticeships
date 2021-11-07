require 'messages'

describe Messages do
  describe '.all' do
    it 'return all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

      peeps = Messages.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('This is another peep!')
    end
  end
end