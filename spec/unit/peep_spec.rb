require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      add_row_to_test_database('First Message')
      add_row_to_test_database('Second Message')
      add_row_to_test_database('Third Message')

      peeps = Peep.all('ASC')

      expect(peeps[0].message).to eq 'First Message'
      expect(peeps[1].message).to eq 'Second Message'
      expect(peeps[2].message).to eq 'Third Message'
    end

    it 'returns a list of all peeps with newest first' do
      add_row_to_test_database('First Message')
      add_row_to_test_database('Second Message')
      add_row_to_test_database('Third Message')

      peeps = Peep.all('DESC')

      expect(peeps[0].message).to eq 'Third Message'
      expect(peeps[1].message).to eq 'Second Message'
      expect(peeps[2].message).to eq 'First Message'
    end

    it 'returns a list of peeps that contain a keyword' do
      add_row_to_test_database('First Message')
      add_row_to_test_database('Second Message')
      add_row_to_test_database('Third Message')
      add_row_to_test_database('I ran 100m in 10 seconds')

      peeps = Peep.all('ASC', keyword="Second")
      
      expect(peeps[0].message).to eq 'Second Message'
      expect(peeps[1].message).to eq 'I ran 100m in 10 seconds'
    end
  end

  describe '.create' do
    it 'stores a new peep in the table' do
      peep = Peep.create('A Message')

      peep_from_db = Peep.all.first

      expect(peep.id).to eq peep_from_db.id
      expect(peep.message).to eq 'A Message'
    end
  end
end