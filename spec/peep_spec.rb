require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      add_row_to_test_database
      
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
    end
  end
end
