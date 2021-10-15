require "peep"

describe Peep do
  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: "chitter_test")
      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("This is another peep!")
    end
  end
end
