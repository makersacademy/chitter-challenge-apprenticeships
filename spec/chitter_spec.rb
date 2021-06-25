require "chitter"

describe Chitter do
  describe ".all" do
    it "returns a list of messages" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('I like this book')")
      connection.exec("INSERT INTO peeps (message) VALUES ('Hello there')")
      peeps = Chitter.all
      p peep = peeps.map { |cur| cur["message"] }
      expect(peep).to include("I like this book")
      expect(peep).to include("Hello there")
    end
  end
end
