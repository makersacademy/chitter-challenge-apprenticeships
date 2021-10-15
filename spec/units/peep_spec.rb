require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps (message) VALUES ('I''m ordering pizza tonight no shame');")
      connection.exec("INSERT INTO peeps (message) VALUES('STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!');")
      connection.exec("INSERT INTO peeps (message) VALUES('I like turtles');")

      peeps = Peep.all

      expect(peeps).to include({ :posted_date => "15/10/2021", :message => "I'm ordering pizza tonight no shame" })
      expect(peeps).to include({ :posted_date => "15/10/2021", :message => "STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!" })
      expect(peeps).to include({ :posted_date => "15/10/2021", :message => "I like turtles" })
    end
  end
  describe "post" do
    it "posts a new peep" do
      Peep.post(message: "This is an example")

      expect(Peep.all).to include({ :posted_date => "15/10/2021", :message => "This is an example" })
    end
  end
end
