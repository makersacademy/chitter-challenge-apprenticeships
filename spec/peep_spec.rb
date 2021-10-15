require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do

      add_row_to_test_database

      peeps = Peep.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('This is a peep too!')
      expect(peeps).to include('This is another peep!')
      expect(peeps).to include('This is just a peep!')
    end
  end

  describe "add" do
    it "add a new peep" do
      Peep.add(message: "Hello Peeps, This is my first peep!")

    expect(Peep.all).to include "Hello Peeps, This is my first peep!"
    end
  end
end
