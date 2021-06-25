require 'message'

describe Message do
    describe '.all' do
        it 'shows all messages' do
            message = Message.all
            expect(message).to eq('This is my first message!')
        end
    end

end
