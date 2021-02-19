require 'peep'

describe Peep do
  describe '.all' do
    it 'prints to the browser all the messages' do
        connection = PG.connect(dbname: 'chitter_test')

        connection.exec("INSERT INTO peeps (message) VALUES ('None of your emails are finding me well');")
        connection.exec("INSERT INTO peeps (message) VALUES ('I need a room full of mirrors so I can be surrounded by winners');")

        peeps = Peep.all

        expect(peeps).to include("None of your emails are finding me well")
        expect(peeps).to include("I need a room full of mirrors so I can be surrounded by winners")
    end
  end

  describe '.create' do
    it 'creates a new message' do
        Peep.create(message: 'Funny how the more we are home the more homeless we look')

        expect(Peep.all).to include 'Funny how the more we are home the more homeless we look'
    end
  end
end

