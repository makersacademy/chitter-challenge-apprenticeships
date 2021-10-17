require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.add(name: 'Peter', message: 'message 123')
      Peep.add(name: 'Joey', message: 'message 321')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.name).to eq 'Peter'
      expect(peeps.first.message).to eq 'message 123'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peep.add(name: 'Patrick', message: 'message ABC123')
      p peep
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'message ABC123'
      expect(peep.name).to eq 'Patrick'
    end
  end
end