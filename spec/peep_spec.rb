require "peep"

describe Peep do
  describe ".view" do
    it "returns a list of all messages" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('Hello world!');")
      connection.exec("INSERT INTO peeps (message) VALUES('How you doin?');")
      connection.exec("INSERT INTO peeps (message) VALUES('Like a glooooove.');")

      peeps = Peep.view

      expect(peeps).to include "Hello world!"
      expect(peeps).to include "How you doin?"
      expect(peeps).to include "Like a glooooove."
    end
  end

  describe ".post" do
    it "posts a new peep" do
      Peep.post(message: "I am king of the world!")
      expect(Peep.view).to include "I am king of the world!"
    end
  end
end
