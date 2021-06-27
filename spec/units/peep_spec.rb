require "peep"

describe Peep do
  let(:msg) { "older message" }
  let(:msg_2) { "latest message" }

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
      Peep.create(message: msg_2)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq msg
      expect(peeps.first.time).to eq Time.new.strftime("%d %b %Y %H:%M")
    end

    it "diplays peeps in reverse chron order" do
      add_row_to_test_database
      add_another_row_to_test_database
      peeps = Peep.all

      expect(peeps.first.message).to eq "This is a recent peep!"
      expect(peeps.last.message).to eq "This is a peep!"
    end
  end

  describe ".filter" do
    it "filters peeps and returns keyword matches (case insensitive matches)" do
      Peep.create(message: msg)
      Peep.create(message: msg_2)

      filter_matches = Peep.filter(keyword: "OlDer")

      expect(filter_matches.first.message).to eq msg
    end
  end
end
