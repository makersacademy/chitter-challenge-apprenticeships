require 'pg'
require'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peeps.all
      expect(["This is a peep!"]).to include("This is a peep!")
    end
  end


describe'.create'do
  it 'creates a new peep' do
    #peep = Peeps.create
    Peeps.create(message: 'here is a new peep')
    expect(Peeps.all).to include 'here is a new peep'
  end
 end
end
