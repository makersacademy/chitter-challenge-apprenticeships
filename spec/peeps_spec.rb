require 'peeps'

describe Peeps do

  describe '#all' do
    it 'returns list of all names and messages' do
      add_row_to_test_database
      expect(Peeps.all).to include("This is a peep!")
    end
  end

  describe '#add' do
    it 'returns list of all names and messages' do
      Peeps.add('This is a new test peep')
      expect(Peeps.all).to include("This is a new test peep")
    end
  end
end
