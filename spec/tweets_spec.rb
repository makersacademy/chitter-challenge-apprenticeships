require 'tweets'

describe Tweets do
  describe '.all' do
    it 'returns all tweets' do
      Tweets.create(message: "This is a tweet", user_id: 1)
      tweet = Tweets.all
      expect(tweet.first.message).to eq("This is a tweet")
    end
  end

  describe '.create' do
    it 'creates a new tweet' do
    tweet = Tweets.create(user_id: 1, message: "this is a test")

    expect(tweet.user_id).to eq '1'
    expect(tweet.message).to eq 'this is a test'

    end
  end
end
