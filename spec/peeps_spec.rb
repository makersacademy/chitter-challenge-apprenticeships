require 'peeps'
require 'pg'

describe Peeps do
  context '.all' do
    it 'returns a list of peeps' do
      connection = DatabaseConnection.setup('chitter_test')
            
      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'First Peep, HELLO Aladdin!'
    end
  end

  context '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: "This is a test peep!")
      persisted_data = persisted_data(id: peep.id)
      allow(Time).to receive(:now).and_return(peep.created_at)
      
      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'This is a test peep!'
      expect(peep.created_at).to eq(Time.now)
    end
  end

  context '.reverse' do
    it 'returns a reverse peep list' do
      connection = DatabaseConnection.setup('chitter_test')

      peeps = Peeps.reverse

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'Third Peep, HELLO Rajah!'
    end
  end

  context '.filter' do
    it 'returns a filtered list' do
      connection = DatabaseConnection.setup('chitter_test')

      peeps = Peeps.filter("G")

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'Second Peep, HELLO Genie!'
    end
  end
end
