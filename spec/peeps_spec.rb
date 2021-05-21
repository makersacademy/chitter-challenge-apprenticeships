require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Oh, hi doggy');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Cheep cheep cheep cheep');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Anything for my princess');")

      peeps = Peep.all

      expect(peeps).to include 'Oh, hi doggy'
      expect(peeps).to include 'Cheep cheep cheep cheep'
      expect(peeps).to include 'Anything for my princess'
    end
  end
end