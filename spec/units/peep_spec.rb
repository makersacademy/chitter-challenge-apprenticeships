require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps VALUES (1, 'Peep 1');")
      connection.exec("INSERT INTO peeps VALUES (2, 'Peep 2');")
      connection.exec("INSERT INTO peeps VALUES (3, 'Peep 3');")
      
      peeps = Peep.all

      expect(peeps).to include("Peep 1")
      expect(peeps).to include("Peep 2")
      expect(peeps).to include("Peep 3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'Example Peep')

      expect(Peep.all).to include 'Example Peep'
    end
  end
end
