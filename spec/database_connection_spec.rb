require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '.setup' do
    it 'establishes a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'executes a query' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec).with('SELECT * FROM peeps;')

      DatabaseConnection.query('SELECT * FROM peeps;')
    end
  end
end
