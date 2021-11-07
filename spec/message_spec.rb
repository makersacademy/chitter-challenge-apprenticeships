require 'message'
require 'date'
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
    describe '#peeps with date' do 
    it 'make a peep' do 
        message = Message.make(message: "Do I have a date?")
        date = Date.today.to_s
    
        expect(message.message).to eq("Do I have a date?")
        expect(message.date).to eq(date)
    end
end
end