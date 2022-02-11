require 'peep'

describe Peep do

  describe '.all' do
    it 'displays all peeps' do
      peeps = Peep.all
      expect(peeps.first.message).to eq('This is a peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create('Test peep!')
      peeps = Peep.all
      expect(peeps.last.message).to eq('Test peep!')
    end
  end
end
