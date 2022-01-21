require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is a test peep!")
      expect(peeps).to include("This is another test peep!")
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      new_peep = 'I created a test peep!'
      Peep.create(new_peep)
      peeps = Peep.all

      expect(peeps).to include(new_peep)
    end
  end
end
