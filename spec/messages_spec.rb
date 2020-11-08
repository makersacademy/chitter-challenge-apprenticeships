require './lib/messages'

describe Message do

    describe '.list' do
        it 'lists all submitted messages' do
            connection = PG.connect(dbname: 'chitter_test')
            connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
            messages = Message.list
            expect(messages).to include 'This is a peep!'
        end
    end

    describe '.add' do
        it 'Adds a new message to chitter' do
            message = Message.add(chit: 'I am posting my 1st chit')
            expect(message).to be_a Message
        end
    end

end