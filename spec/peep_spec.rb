require "peep"

describe Peep do
  describe ".view" do
    it "returns a list of all messages" do
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message, date) VALUES ('Hello world!', '2021-01-01');")
      connection.exec("INSERT INTO peeps (message, date) VALUES('How you doin?', '2021-02-14');")
      connection.exec("INSERT INTO peeps (message, date) VALUES('Like a glooooove.', '2021-07-29');")

      peeps = Peep.view

      expect(peeps[0].message).to eq "Hello world!"
      expect(peeps[1].message).to eq "How you doin?"
      expect(peeps[2].message).to eq "Like a glooooove."
    end
  end

  describe ".post" do
    it "posts a new peep" do
      peep = Peep.post(message: "I am king of the world!")

      expect(peep.message).to eq "I am king of the world!"
      expect(peep.date).to eq Date.today.strftime("%Y-%m-%d")
    end
  end
end
