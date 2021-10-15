require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe "#setup" do
    it 'is able to setup a connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')  
    end
  end

  describe '#query' do
    it 'it able to execute a query' do
      DatabaseConnection.setup('chitter_test')
      DatabaseConnection.query('INSERT INTO peeps(message) VALUES($1)', ['Hello there'])

      response = DatabaseConnection.query('SELECT * FROM peeps;')
      peep = response.first

      expect(peep['message']).to eq 'Hello there'
    end
  end
end
