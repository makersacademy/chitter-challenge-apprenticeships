require 'peep'

describe Peep do
  it 'views all peeps' do
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    peep = Peep.create(message: 'This is a peep!', date: '2021/02/01').first
    peeps = Peep.all
    expect(peeps).to include 'This is a peep!'
  end

  describe '.create' do
    it 'adds a new peep' do
      peep = Peep.create(message: 'This is a peep!', date: '2021/02/01').first
      expect(peep['message']).to eq 'This is a peep!'
      expect(peep['date']).to eq '2021/02/01'
    end
  end
end
