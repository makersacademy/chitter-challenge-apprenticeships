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

  describe '.add' do
    it 'adds a new peep to the db' do
      new_peep = "Hi everyone"
      connection = PG.connect(dbname: 'chitter_test')
      Peeps.add(new_peep)
      result = connection.exec("SELECT * FROM peeps WHERE message = 'Hi everyone';")
      expect(result[0]['message']).to eq "Hi everyone"
    end
  end

  describe '.add' do
    it 'adds a peep with a date' do
      # need to stub in a date for the test
    end
  end


end