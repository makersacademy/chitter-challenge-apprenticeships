require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      mid_peep = Peep.add(name: 'Peter', message: 'message 123', date: '2021-10-17')
      first_peep = Peep.add(name: 'Joey', message: 'message 321', date: '2021-10-15')
      last_peep = Peep.add(name: 'Sara', message: 'message HELLO', date: '2021-10-18')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep

      expect(peeps.first.id).to eq last_peep.id
      expect(peeps.first.name).to eq 'Sara'
      expect(peeps.first.message).to eq 'message HELLO'
      expect(peeps.first.date).to eq '2021-10-18'

      expect(peeps[1].id).to eq mid_peep.id
      expect(peeps[1].name).to eq 'Peter'
      expect(peeps[1].message).to eq 'message 123'
      expect(peeps[1].date).to eq '2021-10-17'

      expect(peeps.last.id).to eq first_peep.id
      expect(peeps.last.name).to eq 'Joey'
      expect(peeps.last.message).to eq 'message 321'
      expect(peeps.last.date).to eq '2021-10-15'
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peep.add(name: 'Patrick', message: 'message ABC123', date: '2021-10-17')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'message ABC123'
      expect(peep.name).to eq 'Patrick'
      expect(peep.date).to eq '2021-10-17'
    end
  end
end