require 'user'
require './lib/database_connection'
require 'persisted_data'

RSpec.describe User do
  describe '.create' do
    it 'creates a User and adds them to the database' do 
      user = User.create("test@example.com", "password1")
      persisted_data = persisted_data(id: user.id, table: 'users')
      
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq "test@example.com"
      expect(user).to be_a User
  end
  end 
end