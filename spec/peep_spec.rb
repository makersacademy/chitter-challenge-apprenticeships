require "peep"

describe Peeps do
  describe ".view" do
    it "shows the user all the peeps" do
      # connection = PG.connect(dbname: "chitter_test")
      # connection.exec("INSERT INTO peeps (message) VALUES ('Karma police');")
      described_class.add("Karma police")
      expect(described_class.view).to include({ :message => "Karma police" })
    end
  end
  describe ".add" do
    it "posts a message to chitter" do
      # connection = PG.connect(dbname: "chitter_test")
      # peeps = Peeps.view
      described_class.add("Arrest this man")
      expect(described_class.view).to include({ :message => "Arrest this man" })
    end
  end
end
