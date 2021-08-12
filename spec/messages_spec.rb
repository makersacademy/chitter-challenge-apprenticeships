require 'messages'
require_relative './setup_test_database'

describe Messages do

  describe '.all' do
    it 'returns all messages' do
      setup_test_database
      
      Messages.create(message: 'Test message 1')
      Messages.create(message: 'Test message 2')
      Messages.create(message: 'Test message 3')

      messages = Messages.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Messages
    end
  end

  describe '.create' do 
    it 'Adds new message' do
    test1 = Messages.create(message: 'new message')

    expect(test1).to include 'new message'
    end 
  end 
end 