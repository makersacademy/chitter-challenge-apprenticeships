describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      add_rows_to_test_database
      peeps = Peep.all
      expect(peeps.first.message).to eq 'This is a peep!' 
      expect(peeps.last.message).to eq 'This is another peep!' 
    end
  end

  describe '#message' do
    it 'returns a Peep\'s message' do
      peep = Peep.new('3', 'Hello!')
      expect(peep.message).to eq 'Hello!'
    end
  end
end