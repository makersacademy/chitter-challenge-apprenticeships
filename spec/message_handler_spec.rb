require_relative '../model/message_handler'
require 'pg'

describe Message_handler do 
  describe '.all' do 
    it 'checks we can retrieve messages' do 
      add_row_to_test_database
      expect(Message_handler.all.first.message).to eq "This is a peep!"
    end 
  end 
  
  describe '.add' do 
    it 'can add a message' do 
      Message_handler.add(message: 'Hello World')
      expect(Message_handler.all.first.message).to eq 'Hello World'
      expect(Message_handler.all.first.timestamp).to eq Time.now.strftime("%d/%m/%Y")
    end 
  end 
  
  describe '.all_filtered' do 
    it 'can filter messages' do 
      Message_handler.add(message: 'Hello World')
      Message_handler.add(message: 'Bye World')
      expect(Message_handler.all_filtered(filter: 'Bye').first.message).to eq 'Bye World'
    end 
  end 
end 