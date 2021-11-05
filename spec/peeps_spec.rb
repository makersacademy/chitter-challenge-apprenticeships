require 'peeps'
require 'pg'

describe Peeps do
    context '.all' do
        it 'returns a list of peeps' do
            connection = PG.connect(dbname: 'chitter_test')

            Peeps.create(message: "First Peep, HELLO WORLD!")
            Peeps.create(message: "Second Peep, HELLO WORLD!")
            Peeps.create(message: "Third Peep, HELLO WORLD!")

            peeps = Peeps.all

            expect(peeps.length).to eq 3
            expect(peeps.first).to be_a Peeps
            expect(peeps.first.message).to eq 'First Peep, HELLO WORLD!'
        end
    end

    context '.create' do
        it 'creates a new peep' do
            peep = Peeps.create(message: "This is a test peep!")
            persisted_data = persisted_data(id: peep.id)

            expect(peep).to be_a Peeps
            expect(peep.id).to eq persisted_data.first['id']
            expect(peep.message).to eq 'This is a test peep!'
        end
    end
end