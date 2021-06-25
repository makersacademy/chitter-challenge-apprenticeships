require "peep"

describe Peep do
  let(:msg) { "This is a test peep" }
  describe ".create" do
    it "creates a new peep record in chitter DB" do
      peep = Peep.create(message: msg)
      persisted_data = PG.connect(dbname: "chitter_test").query(
        "SELECT * FROM peeps WHERE id = #{peep.id};"
      )
      expect(peep).to be_a Peep
      expect(peep.message).to eq msg
      expect(peep.id).to eq persisted_data.first["id"]
      expect(peep.time).to eq persisted_data.first["time"]
    end
  end

  describe ".all" do
    it "diplays all peeps" do
      peep = Peep.create(message: msg)
      Peep.create(message: "Just got the COVID jab, my arm is sore :(")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq msg
    end
  end
end
