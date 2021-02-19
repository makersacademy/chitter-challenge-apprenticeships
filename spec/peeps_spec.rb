require 'peeps'
require 'setup_test_database'
require 'pg'

describe Peeps do

  describe '.all' do
    it 'returns all of the peeps in the database' do
      add_row_to_test_database
      peeps = Peeps.all

      expect(peeps).to include '21/03/2006 Just setting up my chttr.'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      add_row_to_test_database
      Peeps.add(peep:'A test peep')
      peeps = Peeps.all

      expect(peeps).to include '21/03/2006 Just setting up my chttr.'
      expect(peeps).to include "#{Time.new} A test peep"
    end
  end
end
