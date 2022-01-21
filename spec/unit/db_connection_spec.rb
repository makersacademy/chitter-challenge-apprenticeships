require 'db_connection'

describe DBConnection do 
  describe '.setup' do 
    it 'sets up a connection to the database' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DBConnection.setup('chitter_test')
    end
  end

  describe '.query' do 
    it 'can send over an SQL query' do 
      connection = DBConnection.setup('chitter_test')
      connection.exec("INSERT INTO peeps (message, date) values ('This is a peep!', '2022-01-21 12:00:00+00');")

      result = DBConnection.query("SELECT message FROM peeps;")

      expect(result[0]['message']).to eq "This is a peep!"
    end
  end
end
