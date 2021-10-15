require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to the chiiter test database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end

    it 'checks the connection is persistent' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#query' do
    it 'executes a select all query using PG' do
      connection = DatabaseConnection.setup('chitter_test')
  
      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])
  
      DatabaseConnection.query("SELECT * FROM peeps;", [])
    end
  end
end