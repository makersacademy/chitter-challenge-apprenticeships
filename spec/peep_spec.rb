require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(message: 'This is a peep!')
      Peep.create(message: 'Welcome to Chitter!')
      Peep.create(message: 'My first peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep!'
    end

  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'I have arrived!')
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'I have arrived!'
    end

  end

end