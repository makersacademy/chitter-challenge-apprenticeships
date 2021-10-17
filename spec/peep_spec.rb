require "peep"

describe Peep do
  it "returns a list of peeps" do
    peeps = Peep.all

    expect(peeps).to include("This is a peep!")
  end
end
