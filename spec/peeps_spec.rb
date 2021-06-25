require 'peeps'

describe Peeps do

  describe '.all' do
    it 'returns a message from the db' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
      result = connection.exec('SELECT * FROM peeps;')
      expect(result[0]['message']).to eq "This is a peep!"
    end
  end


end