require 'messages'
require 'pg'

describe Messages do 
  describe '.all' do
    it 'returns a list of messages' do
      connection = PG.connect(dbname: 'chitter_test')

      Messages.create(message: 'Hello')
      Messages.create(message: 'Hi!')
      Messages.create(message: 'Hiya.')
      
      messages = Messages.all
  
      expect(messages.length).to eq 3
      expect(messages).to include "Hello"
      expect(messages).to include "Hi!"
      expect(messages).to include "Hiya."
    end
  end

  describe '.create' do 
    it 'creates a new posted peep' do
      Messages.create(message: "This is my first peep!")
      
      expect(Messages.all).to include 'This is my first peep!'
  end 
end 
end