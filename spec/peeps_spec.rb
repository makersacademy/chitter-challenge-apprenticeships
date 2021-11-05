require 'peeps'
require 'pg'

describe Peeps do
    context '.all' do
        it 'returns a list of peeps' do
            connection = PG.connect(dbname: 'chitter_test')

            peeps = Peeps.all

            expect(peeps.length).to eq 3
            expect(peeps.first).to be_a Peep
            expect(peeps.first.message) 
        end
    end
end