require 'peep'

describe Peep do
  
  describe '#self.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('And this is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('And this is a peep too!');")

      peeps = Peep.all

      expect(peeps).to include "This is a peep!"
      expect(peeps).to include "And this is a peep!"
      expect(peeps).to include "And this is a peep too!"
    end
  end

  describe '#self.add' do
    it 'adds a new peep' do
      Peep.add(peep: 'Test peep')

      expect(Peep.all).to include 'Test peep'
    end
  end

end