require 'peep'

describe Peep do 
  describe '.all' do
    it 'Returns all available peeps' do
      add_row_to_test_database
      add_row_to_test_database
      add_row_to_test_database
      all_peeps = Peep.all
      expect(all_peeps.length).to eq 3
      expect(all_peeps.last).to eq('This is a peep!')
    end
  end
end