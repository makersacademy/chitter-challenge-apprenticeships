describe Peeps do
  it 'returns a list of peeps' do
    # connects to database
    connection = PG.connect(dbname: 'chitter_test')

    # Adds the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

    peeps = Peeps.all

    expect(peeps).to include("This is a peep!")
  end
end
