require 'peep'

describe Peep do
  test_peep = Peep.new(name: 'Testguy', message: 'I love #testing', timestamp: '19/02/2021 1148')
  describe "#init" do
    it "has a name associated with the peep" do
      expect(test_peep.name).to eq 'Testguy'
    end

    it "has some message" do
      expect(test_peep.message).to eq 'I love #testing'
    end

    it "has a timestamp" do
      expect(test_peep.timestamp).to eq '19/02/2021 1148'
    end

    it "The keywords can be extracted from the message that are appended with #" do
      expect(test_peep.keywords).to eq ['#testing']
    end
  end
end
