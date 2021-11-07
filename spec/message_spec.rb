require 'message'
describe Message do 
    describe '#messages' do 
        it 'returns a list of messages' do 
            message = Message.make(message: "This is a peep!")
            Message.make(message: "I'm happy today!")
            Message.make(message: "Life is good")
            messages = Message.all

            expect(messages.length).to eq 3
            expect(messages.first).to be_a Message
            expect(messages.first.id).to eq message.id
            expect(messages.first.message).to eq "This is a peep!"
        end
    end
    describe '#peeps' do 
    it 'make a peep' do 
        message = Message.make(message: "Having fun day!")
        
        expect(message).to be_a Message
        expect(message.message).to eq("Having fun day!")
    end
end
end