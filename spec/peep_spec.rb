require "./lib/peep"

describe Peep do
  describe ".all" do
    it "shows all the peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("Insert INTO peeps (message) VALUES('This is a peep');")
      peeps = Peep.all
      expect(peeps.first.message).to include("This is a peep")
    end
  end
end
