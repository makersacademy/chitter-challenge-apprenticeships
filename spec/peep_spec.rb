require 'peep'
require 'setup_test_database'

describe Peep do



  describe '.all' do
    it 'returns a list of peeps' do
      setup_test_database
      add_row_to_test_database

      peeps = Peep.all
      expect(peeps).to include('This is a peep!')
    end
  end



end
