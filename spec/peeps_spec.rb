ENV['ENVIRONMENT'] = 'test'
require_relative '../lib/date.rb'

describe Peeps do
  describe ".add method" do
    it "can add a peep to the database" do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec('SELECT * FROM peeps;').to_a
      expect(result.length).to eq(0)

      Peeps.add(message: 'Test peep')
      result = connection.exec('SELECT * FROM peeps;').to_a

      expect(result.length).to eq(1)
      expect(result[0]['message']).to eq('Test peep')
      expect(result[0]['date']).to eq(give_date)
    end
  end

  describe '.all method' do
    it 'can return all the rows within the database' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message, date) values ('First peep', '#{give_date}');")
      connection.exec("INSERT INTO peeps (message, date) values ('Second peep', '#{give_date}');")
      connection.exec("INSERT INTO peeps (message, date) values ('Third peep', '#{give_date}');")

      result = Peeps.all

      expect(result.length).to eq(3)
      expect(result[0]['message']).to eq('Third peep')
      expect(result[1]['message']).to eq('Second peep')
      expect(result[2]['message']).to eq('First peep')
    end
  end

  describe '.delete method' do
    it 'can delete a peep from the database' do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (message, date) values ('Test peep', '#{give_date}');")
      result = connection.exec("SELECT * FROM peeps;").to_a
      expect(result.length).to eq(1)

      Peeps.delete(id: result[0]['id'])

      result = connection.exec("SELECT * FROM peeps;").to_a
      expect(result.length).to eq(0)
    end
  end

  describe '.filter method' do
    it 'can filter peeps and returns only the ones which have the keyword' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message, date) values ('I finished building my house!', '#{give_date}');")
      connection.exec("INSERT INTO peeps (message, date) values ('My name is Thomas', '#{give_date}');")
      connection.exec("INSERT INTO peeps (message, date) values ('My house is quite old', '#{give_date}');")
      connection.exec("INSERT INTO peeps (message, date) values ('I love cats!', '#{give_date}');")

      result = Peeps.filter(keyword: 'HoUsE')

      result.map! { |peep| peep['message'] }

      expect(result).to include('I finished building my house!')
      expect(result).to include('My house is quite old')
      expect(result).to_not include('My name is Thomas')
      expect(result).to_not include('I love cats!')
    end
  end
end