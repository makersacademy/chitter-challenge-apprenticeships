require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'Yesterday you said tomorrow. Just do it');")
      connection.exec("INSERT INTO peeps VALUES(2, 'It always seems impossible until it is done');")
      
      peeps = Peeps.all

      expect(peeps).to include("Yesterday you said tomorrow. Just do it")
      expect(peeps).to include("It always seems impossible until it is done")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Peeps.create(message: 'This is a test peep')
      expect(Peeps.all).to include('This is a test peep')
    end
  end
end
