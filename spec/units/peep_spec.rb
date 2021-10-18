require "peep"

describe Peep do
  describe ".all_peeps" do
    it "returns an array of all the peeps" do
      expect(Peep.all_peeps()[0][:message]).to eq("This is a peep!");
    end
  end
end