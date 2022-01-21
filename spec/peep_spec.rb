require 'peep'

describe Peep do
  describe '.see_peeps' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');") 

      peeps = Peep.see_peeps

      #expect(peeps).to include('This is a peep!')
      p "see peeps peep spec"
      p peeps[0]
      expect(peeps[0].message).to eq 'This is a peep!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Example peep', date: 'Test date')

      expect(peep.message).to eq 'Example peep'
      expect(peep.date).to eq 'Test date'

      #Peep.create(message: 'Example peep')
  
      #expect(Peep.see_peeps).to include 'Example peep'

      #expect(peep).to be_a Peep
      #expect(peep.date).to eq 'Test date'
      #expect(peep.message).to eq 'Example peep'
    end
  end
end