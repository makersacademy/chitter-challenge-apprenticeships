require "peep"

describe Peeps do
  describe ".view" do
    it "shows the user all the peeps" do
      described_class.add("Karma police")
      expect(described_class.view).to include({ :message => "Karma police" })
    end
  end
  describe ".add" do
    it "posts a message to chitter" do
      described_class.add("Arrest this man")
      expect(described_class.view).to include({ :message => "Arrest this man" })
    end
  end
  describe ".date" do
    it "shows the dates when peeps where posted" do
      date = Time.new(2021, 10, 15, 16, 45)
      described_class.add("He talks in mouths", date)
      expect(described_class.date).to include({ :date => "2021-10-15" })
    end
  end
  describe ".time" do
    it "shows the times when peeps where posted" do
      date = Time.new(2021, 10, 15, 16, 45)
      described_class.add("He buzzes like a fridge", date)
      expect(described_class.time).to include({ :time => "16:45:00" })
    end
  end
end
