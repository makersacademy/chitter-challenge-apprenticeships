require 'database_connection'

RSpec.describe DatabaseConnection do
  describe 'query' do
    it 'runs the given query in the database' do
      connection = DatabaseConnection.setup(dbname: 'chitter_test')
      expect(connection).to receive(:exec).with("SELECT * FROM peeps;")
      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
  describe 'setup' do
    it 'sets up the database to the test database when running RSPEC' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup(dbname: 'chitter_test')
    end
  end
end
