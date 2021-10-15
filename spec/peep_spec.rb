require 'peep'

describe Peep do

  describe '#all' do
    it 'returns empty array if have no messages' do
      expect(Peep.all).to eq []
    end
  end

  describe '#create' do
    it 'adds a new peep to the database' do
      Peep.create(msg: 'Owls are owlsome!')
      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps[0]).to be_instance_of Peep
      expect(peeps[0].msg).to eq 'Owls are owlsome!'
    end
  end
end
