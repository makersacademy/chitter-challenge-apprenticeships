require_relative '../model/message_handler'
require 'pg'

describe Message_handler do 
  describe '.all' do 
    it 'checks we can retrieve messages' do 
      add_row_to_test_database
      expect(Message_handler.all.first.message).to eq "This is a peep!"
    end 
  end 
end 