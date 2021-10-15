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
end