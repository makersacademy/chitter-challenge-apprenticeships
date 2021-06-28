require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(message: 'Peep 1', date: '2021-06-25')
      Peep.create(message: 'Peep 2', date: '2021-06-25')
      Peep.create(message: 'Peep 3', date: '2021-06-25')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'Peep 1'
      expect(peeps.first.date).to eq '2021-06-25'

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Example Peep', date: '2021-06-25')
      persisted_data = persisted_data(id: peep.id)


      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Example Peep'
      expect(peep.date).to eq '2021-06-25'
    end
  end
end
