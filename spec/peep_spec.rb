require 'peep'

describe Peep do 
  describe '.all' do
    it 'Returns all available peeps' do
      Peep.create('This is only a test!')
      Peep.create('This is another test!')
      Peep.create('This is the final test!')
      all_peeps = Peep.all
      expect(all_peeps.length).to eq 3
      expect(all_peeps.last[:peep]).to eq('This is the final test!')
    end
  end
  describe '.create' do
    it 'Adds a peep to the database' do
      test_peep = Peep.create('This is only a test')
      expect(test_peep.first['message']).to eq 'This is only a test'
    end
  end
end
