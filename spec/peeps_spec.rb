require 'peeps'
require 'database_helpers'


describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      con = PG.connect(dbname: 'chitter_test')
      Peeps.create(message:'This is a peep!')
      Peeps.create(message:'Summer is not here yet')
      Peeps.create(message: 'ToYoda is the coolest')
      

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.date).to eq '2021-06-27'

    end
  end

  describe '.create' do
    it 'posts a new message(peep)' do
      peep = Peeps.create(message: 'Hangover Sunday')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peeps
    
      expect(peep.message).to eq 'Hangover Sunday'
      expect(peep.date).to eq '2021-06-27'
    end

  end
end