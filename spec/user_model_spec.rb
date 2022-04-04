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

  context 'Testing Instance Methods,' do
    specify 'should get all posts by user in reverse chronological order' do
      user1 = User.create('test1', 'password')
      user2 = User.create('test2', 'password')
      throw_away = User.create('test3', 'password')
      Post.create('post 1', user1.id)
      Post.create('post 2', user1.id)
      Post.create('post 3', throw_away.id) # to make sure these posts dont get muddled up with the other 2 users
      Post.create('post 4', user1.id)

      Post.create('post 5', user2.id)
      Post.create('post 6', throw_away.id) # to make sure these posts dont get muddled up with the other 2 users
      Post.create('post 7', user2.id)
      Post.create('post 8', throw_away.id) # to make sure these posts dont get muddled up with the other 2 users
      Post.create('post 9', user2.id)

      expect(user1.get_all_posts.length).to eq (3)
      expect(user1.get_all_posts[-1].body).to eq ('post 1')
      expect(user1.get_all_posts[0].body).to eq ('post 4')

      expect(user2.get_all_posts.length).to eq (3)
      expect(user2.get_all_posts[-1].body).to eq ('post 5')
      expect(user2.get_all_posts[0].body).to eq ('post 9')
    end
  end
end
