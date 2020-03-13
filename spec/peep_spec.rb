require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) values('This is a peep!'); ")
      connection.exec("INSERT INTO peeps (message) values('I saw a fox!');")

      peeps = Peep.all

      expect(peeps).to include('This is a peep!')
      expect(peeps).to include('I saw a fox!')
    end
  end

describe '.post' do
  it 'post a new peep' do
    Peep.post(message: 'This is a test peep')
    expect(Peep.all).to include 'This is a test peep'
  end
end


end
