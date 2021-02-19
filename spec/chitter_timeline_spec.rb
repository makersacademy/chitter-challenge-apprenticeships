require 'chitter_timeline'
require 'setup_test_database'
require 'pg'

describe ChitterTimeline do

  describe '.all' do
    it 'returns all of the peeps in the database' do
      add_row_to_test_database
      peeps = ChitterTimeline.all

      expect(peeps).to include '21/03/2006 Just setting up my chttr.'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      add_row_to_test_database
      ChitterTimeline.add(peep:'A test peep')
      peeps = ChitterTimeline.all
      time = Time.new.strftime('%d/%m/%Y') 

      expect(peeps).to include '21/03/2006 Just setting up my chttr.'
      expect(peeps).to include "#{time} A test peep"
    end
  end
end
