require 'pg'
require 'peep'

RSpec.describe '.all' do
    it 'displays a list of messages' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep 2');")

        peeps = Peep.all
        expect(peeps).to include 'This is a peep!'
        expect(peeps).to include 'peep 2'
    end
end

describe '.post' do
    it 'posts a message to chitter' do
        Peep.post('I am building a twitter clone')

        expect(Peep.all).to include 'I am building a twitter clone'
    end
end
        