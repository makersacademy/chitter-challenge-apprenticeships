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
end
