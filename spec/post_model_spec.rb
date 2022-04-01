require_relative '../lib/models/databaseconnection'
require_relative '../lib/models/post'
require_relative '../lib/models/user'
require 'pg'

describe Post do
  context 'Testing Static Methods,' do
    specify 'should create a post' do
      User.create('test', 'test') # just to generate a valid id
      id = User.get_by_username('test')[0]['id']
      r = Post.create('post body', id)
      expect(r).to be_instance_of (PG::Result)
    end

    specify 'should get a post by id' do
      User.create('test', 'test') # just to generate a valid id
      user_id = User.get_by_username('test')[0]['id']
      Post.create('post body', user_id)

      temp = DatabaseConnection.query('SELECT id FROM peeps')
      post_id = temp.to_a[0]['id']

      r = Post.get_by_id(post_id)
      created_on = r.to_a[0]['created_on']

      expect(r.to_a[0]).to eq ({ 'id' => post_id, 'body' => 'post body', 'user_id' => user_id, 'created_on' => created_on })
    end
  end
end
