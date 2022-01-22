require "./lib/peep"

describe Peep do
  describe ".all" do
    it "shows all the peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep');")
      peeps = Peep.all
      expect(peeps.first.message).to include("This is a peep")
    end
  end

  describe ".create" do
    it "create a new peep" do
      Peep.create(message: "This is another peep")
      peeps = Peep.all
      expect(peeps.last.message).to include "This is another peep"
    end
  end

  describe ".filter" do
    it "filters peeps by a keyword" do
      Peep.create(message: "This is another peep")
      Peep.create(message: "Peep peep")
      Peep.filter(keyword: "another")
      peeps = Peep.all
      expect(peeps.last.message).to include "This is another peep"
    end
  end
end
