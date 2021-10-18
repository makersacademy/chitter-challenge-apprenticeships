require "peep"

RSpec.describe Peep do
  describe "#all" do
    it "shows a list of all the messages posted" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('London was experiencing severe congestion in zone 1 today');")
      peeps = Peep.all
      expect(peeps.first.message).to eq "This is a peep!"
      expect(peeps.length).to eq 2
    end
  end

  describe "#add" do
    it "adds a peep to the list of messages posted" do
      peep = Peep.add(message: "Today was not a great day")
      current_time = Time.now
      time = current_time.strftime("%F %T")
      persisted_data = persisted_data(id: peep.id)

      expect(peep.message).to eq "Today was not a great day"
      expect(peep.datetime).to eq time
      expect(peep.id).to eq persisted_data["id"]
    end
  end

  describe "#sort" do
    it "sorts messages by DESC date" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec ("SELECT * FROM peeps ORDER BY datetime DESC")
      peep = Peep.add(message: "Today was not a great day")
      peep = Peep.add(message: "Hello")
      current_time = Time.now
      time = current_time.strftime("%F %T")
      peeps = Peep.sort
      expect(peeps.first.datetime).to eq time
    end
  end
end
