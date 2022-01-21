require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      add_row_to_test_database('First Message')
      add_row_to_test_database('Second Message')
      add_row_to_test_database('Third Message')

      peeps = Peep.all

      expect(peeps[0].message).to eq 'First Message'
      expect(peeps[1].message).to eq 'Second Message'
      expect(peeps[2].message).to eq 'Third Message'
    end
  end
end