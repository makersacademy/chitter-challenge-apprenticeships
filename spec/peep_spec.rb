describe Peep do
  describe '#all' do
    it 'returns every peep' do
      add_rows_to_test_database
      peeps = Peep.all
      expect(peeps.first.message).to eq ('This is a peep!')
      expect(peeps.last.message).to eq ('One more peep!')
    end
  end
end