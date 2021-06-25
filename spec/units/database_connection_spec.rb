# Setup with heavy referencing of the Bookmark Manager 'Extracting a Database Setup Object' Chapter 14
# (and some educated guesswork after having absorbed Eddie's new chapter 12 on security considerations)

require 'pg'
require './lib/database_connection'

describe DatabaseConnection do

  describe '.setup' do

    it 'connects to the test database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end

  end

  describe '.query' do

    it 'executes an injection-protected query via PG' do
      connection = DatabaseConnection.setup('chitter_test')
      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])
      DatabaseConnection.query(sql: "SELECT * FROM peeps;", params: [])
    end

  end
  
end
