require 'peep'

describe Peep do
  describe '#all' do
    it 'responds to .all' do
      expect(Peep).to respond_to(:all)
    end

    it 'returns some peeps' do
      add_2_rows_to_test_database()
      result = Peep.all
      expect(result.first).to be_a(Peep) 
    end
  end

  describe '#message' do
    it 'responds to message' do
      add_2_rows_to_test_database()
      result = Peep.all
      expect(result[0].message).to eq "This is a peep!"
    end
  end
end
