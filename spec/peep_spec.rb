require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'prints to the browser all the messages' do
        connection = PG.connect(dbname: 'chitter_test')

        peep = Peep.create(message: "None of your emails are finding me well")
        Peep.create(message: "I need a room full of mirrors so I can be surrounded by winners")
        
        peeps = Peep.all
        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.message).to eq 'None of your emails are finding me well'
    end
  end

  describe '.create' do
    it 'creates a new message' do
        peep = Peep.create(message: 'Funny how the more we are home the more homeless we look')
        persisted_data = persisted_data(id: peep.id)

        expect(peep).to be_a Peep
        expect(peep.id).to eq persisted_data['id']
        expect(peep.message).to eq 'Funny how the more we are home the more homeless we look'
    end
  end
end

