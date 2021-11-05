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
  describe '.create' do
    it 'Adds a peep to the database' do
      test_peep = Peep.create('This is only a test')
      expect(test_peep.first['message']).to eq 'This is only a test'
    end
  end
end
