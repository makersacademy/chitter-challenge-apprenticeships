require 'peep'
require 'database_helpers'

describe Peep do 

  describe '.all' do 
    it "returns a list of peeps" do 
      peep = Peep.create(message: 'This is a peep!')
      Peep.create(message: 'This is another peep')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'This is a peep!')
      persisted = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted['id']
      expect(peep.message).to eq 'This is a peep!'
    end
  end
end
