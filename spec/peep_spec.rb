require 'peep'
require 'database_helpers'
require 'pg'

describe Peep do
    describe '.all' do
        it 'returns all peeps' do
            connection = PG.connect(dbname: 'chitter_test')
            peep = Peep.create(message: 'This is a test peep.')
            Peep.create(message: 'I like chitter way more than twitter!')

            peeps = Peep.all

            expect(peeps.length).to eq 2
            expect(peeps.first).to be_a Peep
            expect(peeps.first.id).to eq peep.id 
            expect(peeps.first.message).to eq("This is a test peep.")
        end
    end

    describe '.create' do
        it 'creates a new peep' do
            peep = Peep.create(message: 'This is a test peep.')
            persisted_data = persisted_data(table: 'peeps', id: peep.id)

            expect(peep).to be_a Peep
            expect(peep.id).to eq persisted_data['id']
            expect(peep.message).to include 'This is a test peep.'
        end
    end
end