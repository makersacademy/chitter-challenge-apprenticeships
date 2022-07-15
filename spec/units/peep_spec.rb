require 'peep'
require 'database_helpers'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      peep = Peep.add(message: 'This is a peep!', date: '2022-07-15')
      Peep.add(message: 'This is also a peep!', date: '2022-07-10')
      Peep.add(message: 'This is a third peep!', date: '2022-07-05')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq("This is a peep!")
      expect(peeps.first.date).to eq("2022-07-15")
    end
  end

  describe '.add' do
    it 'add a new message' do
      peep = Peep.add(message: 'Example peep', date: '2022-07-15')
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Example peep'
      expect(peep.date).to eq '2022-07-15'
    end
  end
end
