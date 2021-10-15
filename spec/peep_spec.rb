require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('I''m ordering pizza tonight no shame');")
      connection.exec("INSERT INTO peeps (message) VALUES('STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!');")
      connection.exec("INSERT INTO peeps (message) VALUES('I like turtles');")

      peeps = Peep.all

      expect(peeps).to include("I'm ordering pizza tonight no shame")
      expect(peeps).to include("STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!")
      expect(peeps).to include("I like turtles")
    end
  end
end
