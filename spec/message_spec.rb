require 'message'


describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    peeps = Message.all

    expect(peeps).to include('This is a peep!')
    
  end
end
