require 'peep'
require 'pg'

describe Peep do  

  describe '.all' do 
    it 'displays all peeps in the database' do 
      add_row_to_test_database
      peeps = Peep.all
      
      expect(peeps.first.message).to include 'This is a peep!'
    end
  end

  describe '.create' do 
    it 'creates a new peep in the database' do 
      add_row_to_test_database
      peep = Peep.create(message: "This is another peep!")
      all_peeps = Peep.all

      expect(peep.message).to eq "This is another peep!"
      expect(all_peeps.last.id).to eq peep.id
    end
  end
end
