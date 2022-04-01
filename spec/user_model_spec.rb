require_relative '../lib/models/user'
require 'pg'

describe User do
  context 'Testing Static Methods,' do
    specify 'should create a user' do
      r = User.create('test', 'password')
      expect(r).to be_instance_of (User)
      expect(r.username).to eq ('test')
      expect(r.password).to eq ('password')
    end

    specify 'should get a user by id' do
      user = User.create('test', 'password')
      r = User.get_by_id(user.id)
      expect(r.to_h).to eq ({ 'id' => user.id, 'username' => 'test', 'password' => 'password' })
    end

    specify 'should get a user by username' do
      user = User.create('test', 'password')
      r = User.get_by_username(user.username)

      expect(r.to_h).to eq ({ 'id' => user.id, 'username' => 'test', 'password' => 'password' })
    end
  end
end
