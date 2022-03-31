require "peep"

describe Peep do
  context "retrieving information from db" do
    before(:example) do
      connection = PG.connect dbname: "chitter_test"
      connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
      connection.exec("INSERT INTO peeps (username, message) VALUES ('Teddy', 'Bobby is my best friend');")
      connection.exec("INSERT INTO peeps (username, message) VALUES ('Bob', 'You should come to my restaurant');")
      connection.exec("SELECT post_date, TO_CHAR(post_date, 'dd/mm/yyyy') FROM peeps;")
    end

    describe "#show_peeps" do
      it "contains all of the peeps" do
        all_peeps = Peep.show_peeps.map { |row| row[:message] }
        expect(all_peeps).to include "I love Jimmy Jnr"
      end

      it "contains the date" do
        current_date = Time.now.strftime("%d/%m/%Y")
        post_date = Peep.show_peeps.map { |row| row[:post_date] }
        expect(post_date).to include current_date
      end
    end

    describe "#sort_by_date" do
      it "returns the peeps in reverse chronological order" do
        date_sorted_peeps = Peep.sort_by_date
        expect(date_sorted_peeps[0][:message]).to eq "You should come to my restaurant"
      end
    end

    describe "#search" do
      it "returns a searched for term" do
        search_peeps = Peep.search("restaurant")
        expect(search_peeps[0][:message]).to eq "You should come to my restaurant"
      end
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
