require 'pg'
require_relative '../lib/database_handler'

describe Database do
  describe '.connect' do 
    it 'connection to database' do 
      expect(Database.connect).to be_a_instance_of(PG::Connection)
    end 
  end

  describe '.all' do
    it 'returns the whole database' do 
      Database.add(message: "hello")
      expect(Database.all.first['messages']).to eq 'hello'
    end   
  end

  describe '.all_filtered' do
    it 'returns the whole database and filters' do 
      Database.add(message: "hello")
      Database.add(message: "goodbye")
      expect(Database.all_filtered(filter: 'hello').count).to eq 1
    end   
  end
end
