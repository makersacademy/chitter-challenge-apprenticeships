require 'peeps'
require 'database_helpers'
describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      PG.connect(dbname: 'chitter_test')
      
      peep = Peeps.create(message: 'Yesterday you said tomorrow. Just do it')
      Peeps.create(message: 'It always seems impossible until it is done')
      
      peeps = Peeps.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq "Yesterday you said tomorrow. Just do it"
    end
  end

  describe '.create' do
    it 'creates a peep' do

      peep = Peeps.create(message: 'This is a test peep')
      persisted_data = persisted_data(id: peep.id)
    
      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq('This is a test peep')
    end
  end
end
