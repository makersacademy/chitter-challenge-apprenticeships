require 'chitter'

RSpec.describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("This is not Twitter btw.")
      expect(peeps).to include("Jack Dorsey would be proud of this.")
    end
  end
end