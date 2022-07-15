require 'peep'
require 'database_helpers'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      peep = Peep.add(message: 'This is a peep!')
      Peep.add(message: 'This is also a peep!')
      Peep.add(message: 'This is a third peep!')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to include("This is a peep!")
    end
  end

  describe '.add' do
    it 'add a new message' do
      peep = Peep.add(message: 'Example peep')
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Example peep'
    end
  end
end
