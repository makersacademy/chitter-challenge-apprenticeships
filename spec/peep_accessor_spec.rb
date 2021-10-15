require 'peep_accessor'

describe PeepAccessor do
  describe "#all" do
    it "should return an array" do
      expect(described_class.all.class).to eq(Array)
    end

    it "should return an array of length 1" do
      expect(described_class.all.length).to eq(1)
    end
  end

  describe "#add" do
    it "should add another peep to the db" do
      expect{described_class.add_peep('this is another peep!')}.to change{
        described_class.all.length
      }.from(1).to(2)
    end

    it "should add another peep to the db with correct message" do
      described_class.add_peep('this is another peep!')
      test_peep = described_class.all[1]
      expect(test_peep["message"]).to eq('this is another peep!')
    end
  end
end
