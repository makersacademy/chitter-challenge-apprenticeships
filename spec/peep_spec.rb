require 'peep'

RSpec.describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'This is a peep!'
     end
   end

   describe '.create' do
    it 'can add a peep to the database' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      Peep.create('This is another peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'This is another peep!'
     end
   end
end
