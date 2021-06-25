require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('Welcome to Chitter!');")
      connection.exec("INSERT INTO peeps (message) VALUES('My first peep!');")

      peeps = Peep.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('Welcome to Chitter!')
      expect(peeps).to include('My first peep!')
    end

  end

end