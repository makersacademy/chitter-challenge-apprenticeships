require "peep"

describe Peep do
  describe "#show_peeps" do
    it "contains all of the peeps" do
      connection = PG.connect dbname: "chitter_test"
      connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")

      all_peeps = Peep.show_peeps.map { |row| row[:message] }
      expect(all_peeps).to include "I love Jimmy Jnr"
    end

    it "contains the date" do
      connection = PG.connect dbname: "chitter_test"
      connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
      connection.exec("SELECT post_date, TO_CHAR(post_date, 'dd/mm/yyyy') FROM peeps;")

      current_date = Time.now.strftime("%d/%m/%Y")
      post_date = Peep.show_peeps.map { |row| row[:post_date] }
      expect(post_date).to include current_date
    end
  end

  describe "#create" do
    it "makes a new peep" do
      Peep.create(username: "GeneB", message: "I play the keyboard")

      all_peeps = Peep.show_peeps.map { |row| row[:message] }
      expect(all_peeps).to include "I play the keyboard"
    end
  end
end
