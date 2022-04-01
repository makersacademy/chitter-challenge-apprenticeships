require 'peep'
require 'database_helpers'

describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'This is a peep!')
      persisted = persisted_data(id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted['id']
      expect(peep.message).to eq 'This is a peep!'
    end
  end

  describe '.all' do
    it 'returns a list with all the peeps' do
      peep = Peep.create(message: 'This is a peep!')
      Peep.create(message: 'And this is another one!')
      Peep.create(message: 'Woah! And this is yet another!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.date_posted).to eq "#{Date.today}"
    end
  end

  describe '.filter' do
    it 'returns a list of peeps filtered by a keyword' do
      Peep.create(message: 'This is a peep!')
      Peep.create(message: 'And this is another one!')
      peep = Peep.create(message: 'Woah! And this is yet another!')

      filtered_peeps = Peep.filter(keyword: 'yet')

      expect(filtered_peeps.length).to eq 1
      expect(filtered_peeps.first.id).to eq peep.id
      expect(filtered_peeps.first.message).to eq 'Woah! And this is yet another!'
    end
  end
end
