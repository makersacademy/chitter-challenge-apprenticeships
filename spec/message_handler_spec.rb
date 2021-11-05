require_relative '../model/message_handler'
require 'pg'

describe MessageHandler do

  describe '.all' do 
    let(:db_entry) { ["id" => "1047", "messages" => "Hello World", "timestamp" => "05/11/2021"] }
    let(:db_double) { double(:dbdouble, add: db_entry, all: db_entry) }

    it 'checks we can retrieve messages' do 
      MessageHandler.add(db_double, message: 'Hello World')
      expect(MessageHandler.all(db_double).first.message).to eq "Hello World"
    end 
  end 
  
  describe '.add' do 
    let(:db_entry) { ["id" => "1047", "messages" => "Hello World", "timestamp" => "05/11/2021"] }
    let(:db_double) { double(:dbdouble, add: db_entry, all: db_entry) }

    it 'can add a message' do 
      MessageHandler.add(db_double, message: 'Hello World')
      expect(MessageHandler.all(db_double).first.message).to eq 'Hello World'
      expect(MessageHandler.all(db_double).first.timestamp).to eq Time.now.strftime("%d/%m/%Y")
    end 
  end 
  
  describe '.all_filtered' do 
    let(:db_entry) { ["id" => "1047", "messages" => "Hello World", "timestamp" => "05/11/2021"] }
    let(:db_double) { double(:dbdouble, add: db_entry, all: db_entry) }
    let(:db_entry_bye) { ["id" => "1047", "messages" => "Bye World", "timestamp" => "05/11/2021"] }
    let(:db_double_bye) { double(:dbdouble, add: db_entry_bye, all: db_entry_bye, all_filtered: db_entry_bye) }

    it 'can filter messages' do 
      MessageHandler.add(db_double, message: 'Hello World')
      MessageHandler.add(db_double_bye, message: 'Bye World')
      expect(MessageHandler.all_filtered(db_double_bye, filter: 'Bye').first.message).to eq 'Bye World'
    end 
  end 
end 
