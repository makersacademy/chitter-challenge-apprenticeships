require 'peeps'

describe Peeps do
  describe '.all' do
    it 'gives us all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('I am a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('I am another peep!');")

      peeps = Peeps.all
      expect(peeps).to include('I am a peep!')
      expect(peeps).to include('I am another peep!')
    end
  end
end
