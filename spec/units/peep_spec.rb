require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps from the peeps table, displays latest first' do
      add_rows_to_test_database
      peeps = Peep.all
      expect(peeps[0].message).to eq('This is my second peep!')
      expect(peeps[1].message).to eq('This is my first peep!')
    end
  end

  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.create('This is a test peep!', 'User2', '15/10/2021')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep.id).to eq(persisted_data.first['id'])
      expect(peep.message).to eq('This is a test peep!')
      expect(peep.username).to eq('User2')
      expect(peep.date).to eq('15/10/2021')
    end
  end

  describe '#filter' do
    it 'searches for a post based on specific keyword' do
      peep = Peep.create('This is a test peep!', 'User2', '15/10/2021')
      peeps = Peep.filter('test')
      expect(peeps[0].message).to eq('This is a test peep!')
    end
  end
end
