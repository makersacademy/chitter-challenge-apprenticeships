require 'pg'
require 'peep'
require 'database_helpers'

describe Bookmark do

  describe '.all' do 
    it 'returns a list of peeps and their users' do 
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.add(message: 'hello', username:'jenny1')
      Peep.add(message: 'hello2', username:'jenny2')
      Peep.add(message: 'hello3', username:'jenny3')

      peeps = Peep.all

      expect(peeps.length).to eq 3 
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'hello'
      expect(peeps.first.username).to eq 'jenny1'
    end

  describe '.add' do
    it 'creates a new peep' do
      peep = Peep.add(message: 'hello', username: 'jenny123')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'hello'
      expect(peep.username).to eq 'jenny123'
    end
  end

end