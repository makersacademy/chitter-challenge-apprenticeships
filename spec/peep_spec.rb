require_relative '../lib/peep.rb'
require 'pg'


describe Peep do
  describe '#all' do
    it 'returns a list of peeps' do
      connection = PG.connect(:dbname => 'chitter_test')
      
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      
      peeps = Peep.all
      expect(peeps).to include('This is a peep!')
    end
  end
  
  describe '#add' do
    it 'adds a new peep' do
      connection = PG.connect(:dbname => 'chitter_test')
      Peep.add('This is a new peep!')
      result = connection.exec('SELECT * FROM peeps;').to_a
      expect(result[result.length - 1]["message"]).to eq('This is a new peep!')
    end
  end
end