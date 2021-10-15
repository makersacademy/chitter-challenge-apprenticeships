require "peep"
require "setup_test_database"

RSpec.describe Peep do
  describe "#all" do
    it "shows a list of all the messages posted" do
      expect(described_class.all).to eq ["Message1"]
    end
  end
end
