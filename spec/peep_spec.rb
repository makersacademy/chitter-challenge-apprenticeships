require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('message 1');")
      connection.exec("INSERT INTO peeps (message) VALUES('message 2');")
      connection.exec("INSERT INTO peeps (message) VALUES('message 3');")

      peeps = Peep.all

      expect(peeps).to include('message 1')
      expect(peeps).to include('message 2')
      expect(peeps).to include('message 3')
    end
  end
end