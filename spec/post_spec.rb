require 'post'
require 'pg'
require 'database_helpers'

RSpec.describe Post do
  describe '.all' do
    it 'returns a list of posts' do
      connection = PG.connect(dbname: 'chitter_test')

      post = Post.create(author: 'Kate', message: 'This is my first post!')
      Post.create(author: 'Rose', message: 'How are you?')
      Post.create(author: 'Emma', message: 'Working from home')

      messages = Post.all
      expect(messages.length).to eq 3
      expect(messages.first).to be_a Post
      expect(messages.first.id).to eq post.id
      expect(messages.first.author).to eq 'Kate'
      expect(messages.first.message).to eq 'This is my first post!'
    end
  end

  describe '.create' do
    it 'creates a new post' do
      post = Post.create(author: 'Kate', message: 'This is my first post!')
      persisted_data = persisted_data(id: post.id)

      expect(post).to be_a Post
      expect(post.id).to eq persisted_data.first['id']
      expect(post.author).to eq 'Kate'
      expect(post.message).to eq 'This is my first post!'
    end
  end
end
