require 'peep'
require 'pg'

describe Peep do
  
  it 'has a date attribute' do 
    add_row_to_test_database
    peeps = Peep.all

    expect(peeps.first.date).to eq "2022-01-21 12:00:00+00"
  end

  describe '.all' do 
    it 'displays all peeps in the database' do 
      add_row_to_test_database
      peeps = Peep.all
      
      expect(peeps.first.message).to include 'This is a peep!'
    end
  end

  describe '.create' do 
    it 'creates a new peep in the database' do 
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create("This is another peep!")
      all_peeps = Peep.all
      peep_data = connection.exec("SELECT * FROM peeps WHERE message = 'This is another peep!';")

      expect(peep.message).to eq "This is another peep!"
      expect(all_peeps.last.id).to eq peep_data[0]['id']
      expect(all_peeps.last.date).to eq peep_data[0]['date']
    end
  end
end
