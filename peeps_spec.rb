require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('hi there Chitter friends');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Chits for all');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Come and join the party');")

      peeps = Peep.all

      expect(peeps).to include 'hi there Chitter friends'
      expect(peeps).to include 'Chits for all'
      expect(peeps).to include 'Come and join the party'
    end
  end
end
