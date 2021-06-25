require 'tweets'

describe Tweets do
  describe '.all' do
    it 'returns all tweets' do
      tweet = Tweets.all

      expect(tweet).to include("This is a tweet")
      expect(tweet).to include("This is another tweet :)")
    end
  end
end