require 'peep'

describe Peep do
  describe "#all" do
    it "displays all peeps on chitter" do

      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('We''re going to build a well!');")
      connection.exec("INSERT INTO peeps (message) VALUES('Noone needs to pay for it- we got you!');")
      connection.exec("INSERT INTO peeps (message) VALUES('Hang on who needs wells these days anyways?');")

      peeps = Peep.all
      expect(peeps).to include ("This is a peep!")
      expect(peeps).to include ("We're going to build a well!")
      expect(peeps).to include ("Noone needs to pay for it- we got you!")
      expect(peeps).to include ("Hang on who needs wells these days anyways?")

    end
  end
end  