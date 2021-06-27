require "peep"

describe Peep do
  let(:msg) { "hello folks!" }
  let(:msg_2) { "Good afternoon" }

  describe ".create" do
    it "creates a new peep record in chitter DB" do
      peep = Peep.create(message: msg)
      persisted_data = PG.connect(dbname: "chitter_test").query(
        "SELECT * FROM peeps WHERE id = #{peep.id};"
      )
      expect(peep).to be_a Peep
      expect(peep.message).to eq msg
      expect(peep.id).to eq persisted_data.first["id"]
      expect(peep.time).to eq persisted_data.first["create_time"]
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

  describe ".filter" do
    it "filters peeps and returns keyword matches (case insensitive matches)" do
      Peep.create(message: msg)
      Peep.create(message: msg_2)

      filter_matches = Peep.filter(keyword: "Hello")

      expect(filter_matches.first.message).to eq msg
    end
  end
end
