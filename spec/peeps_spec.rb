require_relative "../lib/peeps"
require_relative "./setup_test_database"

describe Peeps do
  describe "#.all" do
    it "returns a list of all peeps" do
      setup_test_database
      add_row_to_test_database
      expect(Peeps.all.first).to eq "This is a peep!"
    end
  end
end
