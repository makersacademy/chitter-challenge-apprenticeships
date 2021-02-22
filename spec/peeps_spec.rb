require 'peeps'
require 'setup_test_database'
require 'database_helpers'
require 'pg'

describe Peeps do

  describe '.all' do
    it 'returns all of the peeps in the database' do
      peep = Peeps.add(peep: 'inviting my co-makers')
      add_row_to_test_database    

      peeps = Peeps.all
      expect(peeps.first).to be_a Peeps
      expect(peeps.last.peep).to eq 'inviting my co-makers'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peeps.add(peep:'inviting my co-makers')
      persisted_data = persisted_data(id: peep.id)
      peeps = Peeps.all
      

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq peeps.last.peep
    end
  end
end
