require 'peep'

describe Peep do
  
  describe '.all' do
    it 'returns a list of all peeps' do
      
      Peep.create(message: "Test")
      Peep.create(message: "Hello world")

      peeps = Peep.all

      expect(peeps.length).to eq(2)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.message).to eq("Hello world")
      expect(peeps.first.date).to eq(Time.now.strftime("%d/%m/%Y"))
    end    
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'Test peep')

      expect(peep).to be_a(Peep)
      expect(peep.message).to eq('Test peep')
      expect(peep.date).to eq(Time.now.strftime("%d/%m/%Y"))
    end
  end

end