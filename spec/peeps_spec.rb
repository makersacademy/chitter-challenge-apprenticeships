require 'peeps'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.create(message: 'This is a peep!', created_at: 'created_at')
      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps.first.message).to eq 'This is a peep!'
    end
  end
  describe '.create' do
    it 'adds a bookmark' do
      peep = Peep.create(message: 'Test peep', created_at: '2020-03-13 14:23:25.164956')
      persisted_data = persisted_data(id: peep.id)
      expect(peep.message).to eq 'Test peep'
      expect(peep.created_at).to eq '2020-03-13 14:23:25.164956'
    end
  end
end
