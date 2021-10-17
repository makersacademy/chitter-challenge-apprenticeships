require "peep"

describe Peep do
  describe "#all" do
    it "returns a list of peeps" do
      db = PG.connect(dbname: "chitter_test")
      db.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

      expect(Peep.all).to include("This is a peep!")
    end
  end
  describe "#create" do
    it "adds a new peep to database" do
      Peep.create("This is a new peep!")
      expect(Peep.all).to include("This is a new peep!")
    end
  end
end
