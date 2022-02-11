describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
    peeps = Peeps.all

    expect(peeps).to include('This is a peep!')
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create('This is a new peep!')
  
      expect(Peeps.all).to include 'This is a new peep!'
    end
  end
end