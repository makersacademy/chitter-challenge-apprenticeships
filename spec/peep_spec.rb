require 'peep'

describe Peep do
  describe '.see_peeps' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (messages) VALUES ('This is a peep!')") 

      peeps = Peep.see_peeps

      expect(peeps).to include('This is a peep!')
    end
  end
end