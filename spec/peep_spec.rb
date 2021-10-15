require "peep"

RSpec.describe Peep do
  describe "#all" do
    it "shows a list of all the messages posted" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('London was experiencing severe congestion in zone 1 today');")
      peeps = Peep.all
      expect(peeps).to include "This is a peep!"
      expect(peeps).to include "London was experiencing severe congestion in zone 1 today"
    end
  end
end
