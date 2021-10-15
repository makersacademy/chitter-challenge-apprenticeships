require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do

      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep too!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is just a peep!');")
      peeps = Peep.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('This is a peep too!')
      expect(peeps).to include('This is another peep!')
      expect(peeps).to include('This is just a peep!')
    end
  end
end
