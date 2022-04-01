require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

         # Add the test data
        connection.exec("INSERT INTO peeps (message) VALUES ('Hello world!');")
        connection.exec("INSERT INTO peeps (message) VALUES('Hi Chitter! This is my first peep!');")
        connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

        peeps = Peep.all

        expect(peeps).to include("Hello world!")
        expect(peeps).to include("Hi Chitter! This is my first peep!")
        expect(peeps).to include("This is a peep!")
    end
  end
end