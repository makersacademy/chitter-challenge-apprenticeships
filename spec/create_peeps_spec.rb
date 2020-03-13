require 'pg'
require'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      peeps = Peeps.all
      expect(["This is a peep!"]).to include("This is a peep!")
    end
  end
end
