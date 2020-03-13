describe Peeps do
  it 'returns a list of peeps' do
    # connects to database
    connection = PG.connect(dbname: 'chitter_test')

    # Adds the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

    peeps = Peeps.all

    expect(peeps).to include("This is a peep!")
  end


  it 'can add a peep' do
    Peeps.add_peep(message: 'I have added a peep')

    # Add the new peep data
    expect(Peeps.all).to include 'I have added a peep'

  end
end
