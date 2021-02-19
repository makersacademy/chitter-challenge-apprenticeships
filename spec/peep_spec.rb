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
end