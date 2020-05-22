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


     it 'returns a created_at time and date' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.created_at.nil?).to eq(false)
     end

     it 'returns a list of peeps ordered by datetime descending' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      peep = connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
      another_peep = connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

      peeps = Peep.all
      first_peep = peeps[0]
      second_peep = peeps[1]
      
      expect(first_peep.created_at).to be > (second_peep.created_at)
     end
   end

  describe '.create' do
    it 'can add a peep to the database' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      Peep.create(message:'This is another peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'This is another peep!'
    end
  end


end
