require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is another peep');")
      
      peeps = Peep.all

      expect(peeps.first.message).to include('This is another peep')

    end

  end

end