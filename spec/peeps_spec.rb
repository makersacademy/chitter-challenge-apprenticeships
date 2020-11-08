require 'peeps'

describe Peeps do
  describe '.all' do
    it 'gives a list of all peeps' do
      require 'pg'
      connection = PG.connect(dbname: 'chitter_test')

      peep_1 = Peeps.create(username: 'Melissa', message: 'Hiya')
      peep_2 = Peeps.create(username: 'Frank', message: 'Whatup Buttercup')
      peep_3 = Peeps.create(username: 'Lilo', message: 'Ohana')

      persisted_data_1 = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep_1.id};")
      persisted_data_2 = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep_2.id};")
      persisted_data_3 = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep_3.id};")

      peeps = Peeps.all

      expect(peeps[0].id).to eq persisted_data_1.first['id']
      expect(peeps[1].id).to eq persisted_data_2.first['id']
      expect(peeps[2].id).to eq persisted_data_3.first['id']

    end
  end

describe '.create' do
  it 'creates a new peep' do
    peeps = Peeps.create(username: 'Melissa',message: 'This is my first peep')
    persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peeps.id};")

    expect(peeps).to be_a Peeps
    expect(peeps.id).to eq persisted_data.first['id']
    expect(peeps.username).to eq 'Melissa'
    expect(peeps.message).to eq 'This is my first peep'
  end
end

end
