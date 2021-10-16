# Unit tests for the Peep class

require 'peep'

RSpec.describe Peep do
  
  describe '#all' do
    it 'returns all peeps (messages)' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) values ('Hello, this is a new peep!');")
      connection.exec("INSERT INTO peeps (message) values ('What peep shall I write today?');")
      connection.exec("INSERT INTO peeps (message) values ('My favourite food is pizza');")

      all_peeps = Peep.all

      expect(all_peeps).to include("Hello, this is a new peep!")
      expect(all_peeps).to include("What peep shall I write today?")
      expect(all_peeps).to include("My favourite food is pizza")

    end
  end

  describe '#initialize' do
    it 'returns a Peep instance' do
      new_peep = Peep.new("Welcome peeps")
      expect(new_peep.message).to eq("Welcome peeps")  
    end
  end

end
