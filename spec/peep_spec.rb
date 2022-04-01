require "peep"

describe Peep do

  describe "::create" do
    it "creates a new peep" do
      peep = Peep.create(message: "This is a peep")
      persisted_data = PG.connect(dbname: "chitter_test").query("SELECT * FROM peeps WHERE id = #{peep.id}")
      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data.first["id"])
      expect(peep.message).to eq("This is a peep")
    end
  end
end
