require "peep"

describe "Peep" do
  describe ".view" do
    it "shows the user all the peeps" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('Testing, Testing 123');")
      p peeps = Peep.view
      expect(peeps).to include({ :message => "Testing, Testing 123" })
    end
  end
end
