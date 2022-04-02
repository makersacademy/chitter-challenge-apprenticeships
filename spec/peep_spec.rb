require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

         # Add the test data
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Hello world!', 3);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('Hi Chitter! This is my first peep!', 2);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('This is a peep!',3);")

        peeps = Peep.all

        expect(peeps[0].message).to include("Hello world!")
        expect(peeps[1].message).to include("Hi Chitter! This is my first peep!")
        expect(peeps[2].message).to include("This is a peep!")
    end
  end

    describe '.own_peeps' do
    it 'returns all my peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Can''t believe it''s snowing in April', 1);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Happy Friday everyone!', 1);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Looking forward to the weekend!', 1);")

        peeps = Peep.own_peeps

        expect(peeps[0].message).to include("Can't believe it's snowing in April")
        expect(peeps[1].message).to include("Happy Friday everyone!")
        expect(peeps[2].message).to include("Looking forward to the weekend!")
    end
  end
end