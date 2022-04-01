require_relative '../lib/models/databaseconnection'
require_relative '../lib/models/post'
require_relative '../lib/models/user'
require 'pg'

describe Post do
  context 'Testing Static Methods,' do
    specify 'should create a post' do
      user = User.create('test', 'test') # just to generate a valid id
      r = Post.create('post body', user.id)
      expect(r).to be_instance_of (Post)
      expect(r.body).to eq ('post body')
      expect(r.user_id).to eq (user.id)
    end

    specify 'should get a post by id' do
      user = User.create('test', 'test') # just to generate a valid id
      post = Post.create('post body', user.id)
      r = Post.get_by_id(post.id)
      expect(r.to_h).to eq ({ 'id' => post.id, 'body' => 'post body', 'user_id' => user.id, 'created_on' => post.created_on })
    end
  end
end
