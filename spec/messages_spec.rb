require './lib/messages'

describe Message do

    describe '.list' do
        it 'lists all submitted messages' do
            messages = Message.list
            expect(messages).to include 'This is a peep!'
        end
    end

end