require 'peep'
require 'database_helpers'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # connection.exec("INSERT INTO peeps (message) values('This is a peep!'); ")
      # connection.exec("INSERT INTO peeps (message) values('I saw a fox!');")
      peep = Peep.post(message: "This is a peep!", author: "Dumbo")
      Peep.post(message: "I saw a fox!", author: "Pluto")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.author).to eq 'Dumbo'
      expect(peeps.first.message).to eq 'This is a peep!'

      # expect(peeps).to include('This is a peep!')
      # expect(peeps).to include('I saw a fox!')
    end
  end

describe '.post' do
  it 'post a new peep' do
    peep = Peep.post(message: 'This is a test peep', author: 'Jordan')
    persisted_data = persisted_data(id: peep.id)

    # expect(Peep.all).to include 'This is a test peep'
    # expect(peep['message']).to eq 'This is a test peep'
    # expect(peep['author']).to eq 'Jordan'

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.author).to eq 'Jordan'
    expect(peep.message).to eq 'This is a test peep'
  end
end


end
