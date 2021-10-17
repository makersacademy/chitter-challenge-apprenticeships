require "peep"

describe Peep do
  it "returns a list of peeps" do
    db = PG.connect(dbname: "chitter_test")
    db.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

    peeps = Peep.all

    expect(peeps).to include("This is a peep!")
  end
end
