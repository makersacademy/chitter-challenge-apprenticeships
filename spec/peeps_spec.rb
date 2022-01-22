require "peep"
require "pg"

describe Peep do
  
  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: "chitter_test")

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is the second peep!');")
      peeps = Peep.all
      expect(peeps).to include ("This is a peep!")
      expect(peeps).to include("This is the second peep!")
    end
  end
  
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'This is my Third peep')
      expect(Peep.all).to include 'This is my Third peep'
    end
  end

end