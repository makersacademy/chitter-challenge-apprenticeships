require "peep"

describe Peep do

  describe "::create" do
    it "creates a new peep" do
      peep = Peep.create(message: "This is a peep")
      persisted_data = PG.connect(dbname: "chitter_test").query("SELECT * FROM peeps WHERE id = #{peep.id}")
      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data.first["id"])
      expect(peep.message).to eq("This is a peep")
      expect(peep.date).to eq(Date.today.to_s)
    end
  end

  describe "::all" do
    it "returns all peeps" do
      first_peep = Peep.create(message: "Test peep 1")
      second_peep = Peep.create(message: "Test peep 2")
      peeps = Peep.all
      expect(peeps.length).to eq(2)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.id).to eq(first_peep.id)
      expect(peeps.first.message).to eq("Test peep 1")
      expect(peeps.first.date).to eq(Date.today.to_s)
    end
  end
end
