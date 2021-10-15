# Unit tests for the Peep class

require 'peep'

RSpec.describe Peep do
  
  describe '#all' do
    it 'returns all peeps (messages)' do
      all_peeps = Peep.all
      expect(all_peeps).to include("Hello, this is a new peep!")
    end
  end
end