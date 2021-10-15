require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns al list of peeps messages' do
        connection = PG.connect(dbname: 'chitter_test')

          # Add the test data
        connection.exec("INSERT INTO peeps (message) VALUES ('peep1');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep2');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep3');")
     
        peeps = Peeps.all

        expect(peeps).to include("peep1")
        expect(peeps).to include("peep2")
        expect(peeps).to include("peep3")
    end
  end
end

describe '.create' do
    it 'creates a new message' do
      Peeps.create(message: 'hello chitter')
  
      expect(Peeps.all).to include 'hello chitter'
    end
  end