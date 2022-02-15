require 'peep'

describe Peep do

  describe '.new' do
    it 'creates a new peep' do
      Peep.new(peep: 'ever danced with the devil in the pale moonlight?')

      expect(Peep.all).to include 'ever danced with the devil in the pale moonlight?'
    end
  end

  describe '.all' do
    it 'returns all peeps' do

      add_row_to_test_database
      
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("Ive got blisters on me fingers!")
    end
  end

end
