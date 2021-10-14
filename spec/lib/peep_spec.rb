require 'peep'

describe Peep do
  describe '#all' do
    it 'returns a peep' do
      DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a peep');")

      peeps = Peep.all
      peep = peeps.first

      expect(peep.message).to eq 'This is a peep'
    end
  end

  describe "#format_date" do
    it 'formats the date in the correct format' do
      date = Peep.format_date('2021-10-14')
      expect(date).to eq '14/10/21'
    end
  end

  describe "#create" do
    it 'adds a new peep to the database, no date passed' do
      peep = Peep.create('This is a fun new peep')

      response = DatabaseConnection.query("SELECT * FROM peeps;")
      database_peep = response.first

      expect(peep.message).to eq database_peep['message']
    end

    it 'adds a new peep to the database, date passed' do
      peep = Peep.create('This is a fun new peep', '2020-10-19')
      
      response = DatabaseConnection.query("SELECT * FROM peeps;")
      database_peep = response.first

      expect(peep.message).to eq database_peep['message']
      expect(peep.date).to eq database_peep['date']
    end
  end
end
