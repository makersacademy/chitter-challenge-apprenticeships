require 'peep'

describe Peep do
    describe 'all' do
        it 'should retrieve all messages in database' do
            add_row_to_test_database

            expect(Peep.all).to include("This is a peep!")
        end
    end
end