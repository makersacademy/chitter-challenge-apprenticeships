require 'chitter'
require 'database_helpers'

RSpec.describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      
      # Add the test data
      peep = Peeps.create(message: "Jack Dorsey would be proud of this.")
      Peeps.create(message: "This is not Twitter btw.")


      peeps = Peeps.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq("Jack Dorsey would be proud of this.")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: 'This is a test peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq('This is a test peep')
    end
  end
end