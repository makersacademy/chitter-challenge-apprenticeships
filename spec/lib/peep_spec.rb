require 'peep'

describe Peep do
  descibe '#all' do
    it 'returns a peep' do
      DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a peep');")

      peeps = Peep.all
      peep = peeps.first

      expect(peep.message).to eq 'This is a peep'
    end
  end
end
