require 'message'
require 'database_helpers'

describe Message do
    describe '.all' do
        it 'returns all messages' do
            connection = PG.connect(dbname: 'chitter_test')

            message = Message.create(message: 'This is my first message!')
            Message.create(message: 'This is my second message!')
            Message.create(message: 'This is my third message!')

            messages = Message.all

            expect(messages.length).to eq 3
            expect(messages.first).to be_a Message
            expect(messages.first.id).to eq message.id
            expect(messages.first.message).to eq 'This is my first message!'
        end
    
    end

    describe '.create' do
        it 'creates a new message' do
            new_message = Message.create(message: 'To all my chitter followers..')
            persisted_data = persisted_data(id: new_message.id)
            
            expect(new_message).to be_a Message
            expect(new_message.id).to eq persisted_data['id']
            expect(new_message.message).to eq 'To all my chitter followers..'
        end
    end

end

