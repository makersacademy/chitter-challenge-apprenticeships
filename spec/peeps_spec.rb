require_relative "../lib/peeps"

describe Peeps do
  describe "#.all" do
    it "returns a list of all peeps" do
      peeps = Peeps.new
      expect(peeps.all.first).to eq "This is a peep!"
    end
  end
end
