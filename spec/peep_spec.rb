require "peep"

describe "Peeps" do
  describe ".view" do
    it "shows the user all the peeps" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('Testing, Testing 123');")
      p peeps = Peeps.view
      expect(peeps).to include({ :message => "Testing, Testing 123" })
    end
  end
end
