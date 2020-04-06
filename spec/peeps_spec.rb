require 'peeps'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(message: 'This is a peep!')
      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps.first.message).to eq 'This is a peep!'
    end
  end
  describe '.create' do
    it 'adds a peep' do
      peep = Peep.create(message: 'Test peep')
      persisted_data = persisted_data(id: peep.id)
      expect(peep.message).to eq 'Test peep'
    end
  end
end
