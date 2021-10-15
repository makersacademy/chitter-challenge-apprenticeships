require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do
      connection = PG.connect(dbname: "chitter_test")

      peep = Peep.post(message: "I''m ordering pizza tonight no shame")
      Peep.post(message: "STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!")
      Peep.post(message: "I like turtles")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq "I'm ordering pizza tonight no shame"
      expect(peeps.first.pretty_date).to eq "- Peeped on 15/10/2021"
    end
  end

  describe "post" do
    it "posts a new peep" do
      peep = Peep.post(message: "This is an example")
      persisted_data = PG.connect(dbname: "chitter_test").query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first["id"]
      expect(peep.message).to eq "This is an example"
      expect(peep.pretty_date).to eq "- Peeped on 15/10/2021"
    end
  end
end
