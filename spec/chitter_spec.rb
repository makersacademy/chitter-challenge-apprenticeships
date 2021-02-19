require 'chitter'

RSpec.describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      
      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is not Twitter btw.');")
      connection.exec("INSERT INTO peeps (message) VALUES('Jack Dorsey would be proud of this.');")


      peeps = Peeps.all

      expect(peeps).to include("This is a peep!")
      expect(peeps).to include("This is not Twitter btw.")
      expect(peeps).to include("Jack Dorsey would be proud of this.")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(message: 'test peep')

      expect(Peeps.all).to include 'test peep'
    end
  end
end