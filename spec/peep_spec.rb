require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
     
      connection.exec("INSERT INTO peeps (message) VALUES('peep1!'); ")
      connection.exec("INSERT INTO peeps (message) VALUES('peep2!'); ")
      connection.exec("INSERT INTO peeps (message) VALUES('peep3!'); ")
       peeps = Peep.all
      expect(peeps).to include("peep1!")
      expect(peeps).to include("peep2!")
      expect(peeps).to include("peep3!")
    end
  end
end