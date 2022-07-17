require 'Peeps'
require 'database_helpers'

describe Peeps do
  describe '.all' do
    it 'returns all chitter posts' do
      connection = PG.connect(dbname: 'chitter_test')
      time_when_tested = "2022-07-15 12:00:15"
      peep = Peeps.create(peep: "Hello this is my unit test for .all", time: time_when_tested)
      Peeps.create(peep: "Hello this another peep from my unit test", time: time_when_tested)
      peeps = Peeps.all
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "Hello this is my unit test for .all"
      expect(peeps.first.time).to eq time_when_tested
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      time_when_tested2 = "2022-07-15 19:05:11"
      peep = Peeps.create(peep: 'This is a test peep!', time: time_when_tested2)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'This is a test peep!'
      expect(peep.time).to eq time_when_tested2
    end
  end
end
