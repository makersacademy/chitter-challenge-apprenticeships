require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
    end
  end

  describe '.create' do
    it 'adds a new peep to the db' do
      Peep.create(message: 'This is a new peep!')

      peeps = Peep.all

      expect(peeps).to include 'This is a new peep!'
    end
  end
end 
