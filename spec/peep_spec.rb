require 'peep'

describe Peep do
  test_peep = Peep.new(user: 'Testguy', content: 'I love #testing', timestamp: '19/02/2021 1148')
  describe "#init" do
    it "has a user associated with the peep" do
      expect(test_peep.user).to eq 'Testguy'
    end

    it "has some content" do
      expect(test_peep.content).to eq 'I love #testing'
    end

    it "has a timestamp" do
      expect(test_peep.timestamp).to eq '19/02/2021 1148'
    end

    it "The keywords can be extracted from the content that are appended with #" do
      p test_peep.keywords
      expect(test_peep.keywords).to eq ['#testing']
    end
  end
end