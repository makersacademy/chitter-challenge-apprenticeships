require "peep"

describe Peep do
  describe "#show_peeps" do
    it "contains all of the peeps" do
      connection = PG.connect dbname: "chitter_test"
      connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")

      all_peeps = Peep.show_peeps.map { |row| row[:message] }
      expect(all_peeps).to include "I love Jimmy Jnr"
    end
  end

  #TODO unit test for making a new peep
  describe Peep do
    describe "#create" do
      it "makes a new peep" do
        Peep.create(username: "GeneB", message: "I play the keyboard")

        all_peeps = Peep.show_peeps.map { |row| row[:message] }
        expect(all_peeps).to include "I play the keyboard"
      end
    end
  end
end
