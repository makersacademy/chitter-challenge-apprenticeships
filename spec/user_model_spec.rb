require_relative '../lib/models/user'
require 'pg'

describe User do
  context 'Testing Static Methods,' do
    specify 'should create a user' do
      r = User.create('test', 'password')
      expect(r).to be_instance_of (PG::Result)
    end

    specify 'should get a user by id' do
      User.create('test', 'password')
      r = User.get_by_username('test')

      expect(r).to be_instance_of (PG::Result)
      expect(r[0]).to be_instance_of (Hash)

      id = r[0]['id'] # variable id
      expect(r.to_a).to eq [{ 'id' => id, 'username' => 'test', 'password' => 'password' }]
    end

    specify 'should get a user by username' do
      User.create('test', 'password')
      temp = User.get_by_username('test')
      id = temp[0]['id'] # variable id
      r = User.get_by_id(id)

      expect(r.to_a).to eq [{ 'id' => id, 'username' => 'test', 'password' => 'password' }]
    end
  end
end
