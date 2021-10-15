require "peep"

describe Peep do
  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: "chitter_test")
      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

      peeps = Peep.all

      expect(peeps).to include({ :date_posted => "15/10/2021", :message => "This is a peep!" })
      expect(peeps).to include({ :date_posted => "15/10/2021", :message => "This is another peep!" })
    end
  end

  describe ".post" do
    it "posts a new peep to Chitter" do
      Peep.post(message: "Working on Friday challenge")

      expect(Peep.all).to include({ :date_posted => "15/10/2021", :message => "Working on Friday challenge" })
    end
  end
end
