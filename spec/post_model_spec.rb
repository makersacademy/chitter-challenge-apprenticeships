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

    specify 'should get all posts in reverse chronological order' do
      user = User.create('test', 'test') # just to generate a valid id
      Post.create('post body 1', user.id)
      Post.create('post body 2', user.id)
      Post.create('post body 3', user.id)
      Post.create('post body 4', user.id)
      r = Post.get_all
      expect(r.length).to eq (4)
      expect(r[0].body).to eq ('post body 4')
      expect(r[-1].body).to eq ('post body 1')
    end
  end

  context 'Testing Instance Methods,' do
    specify 'should get user postee from post' do
      user = User.create('test', 'test') # just to generate a valid id
      post = Post.create('post body', user.id)
      r = post.get_postee
      expect(r.to_h).to eq ({ 'id' => user.id, 'username' => 'test', 'password' => 'test' })
    end
  end
end
