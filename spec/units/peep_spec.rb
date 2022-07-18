require 'peep'
require 'database_helpers'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      peep = Peep.add(message: 'This is a peep!', date: '2022-07-15')
      Peep.add(message: 'This is also a peep!', date: '2022-07-10')
      Peep.add(message: 'This is a third peep!', date: '2022-07-05')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq("This is a peep!")
      expect(peeps.first.date).to eq("2022-07-15")
    end

    it 'sorts messages reverse chronologically' do
      Peep.add(message: 'Old peep', date: '2022-07-01')
      Peep.add(message: 'New peep', date: '2022-07-15')
      
      peeps = Peep.all

      expect(peeps[0].message).to eq("New peep")
      expect(peeps[1].message).to eq("Old peep")
    end
  end

  describe '.add' do
    it 'add a new message' do
      peep = Peep.add(message: 'Example peep', date: '2022-07-15')
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Example peep'
      expect(peep.date).to eq '2022-07-15'
    end
  end

  describe '.filter' do
    it 'returns sorted list of messages that include given keyword' do
      Peep.add(message: 'Banana peep', date: '2022-07-05')
      Peep.add(message: 'Apple', date: '2022-07-10')
      Peep.add(message: 'Another banana peep', date: '2022-07-15')
  
      peeps = Peep.filter('banana')

      expect(peeps.length).to eq 2
      expect(peeps[0].message).to eq("Another banana peep")
      expect(peeps[1].message).to eq("Banana peep")
    end
  end
end
