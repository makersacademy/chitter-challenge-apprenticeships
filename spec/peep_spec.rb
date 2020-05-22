require_relative './setup_test_database'
require 'peep.rb'
require 'pg'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peep.add(message: 'This is a peep!')
      Peep.add(message:'This is also a peep!')
      Peep.add(message:'This is another peep!')
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.date).to eq Date.today
    end
  end
  describe '.add' do
    it 'can add a new entry' do
      peep = Peep.add(message: 'This is a peep!')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'This is a peep!'
      expect(peep.date).to eq Date.today
    end
  end
end
