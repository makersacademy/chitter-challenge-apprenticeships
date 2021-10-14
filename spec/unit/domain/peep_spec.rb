require 'domain/peep'

describe Peep do
  describe '#==' do
    it 'two peeps are the same if the ID matches' do
      peep1 = Peep.new("I'm a peep!", DateTime.new(2021, 10, 15), 1)
      peep2 = Peep.new("I'm a peep!", DateTime.new(2021, 10, 15), 1)

      expect(peep1).to eq peep2

    end
  end
end