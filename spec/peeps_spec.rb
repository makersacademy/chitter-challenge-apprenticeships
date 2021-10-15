require './lib/peeps'

describe Peeps do
  describe '#all' do
    it 'should return a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      
      peeps = Peeps.all

      expect(peeps).to include('This is a peep!')
    end
  end

  describe '#create' do
    it 'should add a new peep' do
      Peeps.create('This is a peep!')
      expect(Peeps.all).to include('This is a peep!')
    end
  end
end