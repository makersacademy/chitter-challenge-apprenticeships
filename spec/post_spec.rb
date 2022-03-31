require 'post'

RSpec.describe Post do
  describe '.all' do
    it 'returns all posts' do
      post = Post.all
      expect(post).to include("Best day of my life")
      expect(post).to include("Tennis related news")
      expect(post).to include("Grateful")
    end
  end
end
