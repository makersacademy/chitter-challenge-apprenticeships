require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns a list of messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Second peep!!');")
      peeps = Peeps.all
      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('Second peep!!')
    end
  end

  describe '.create' do
    it 'creates a peep post' do
      Peeps.create(message: 'creating a Chitter!')
      expect(Peeps.all).to include 'creating a Chitter!'
    end
  end
end
