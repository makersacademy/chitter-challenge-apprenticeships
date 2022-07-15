require 'peep'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is also a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a third peep!');")
      
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("This is also a peep!")
      expect(peeps).to include("This is a third peep!")
    end
  end

  describe '.add' do
    it 'add a new message' do
      Peep.add(message: 'Example peep')
  
      expect(Peep.all).to include 'Example peep'
    end
  end
end
