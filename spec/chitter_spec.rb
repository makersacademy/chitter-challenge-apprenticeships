require 'chitter'

describe '.all' do
  it 'shows all the chitter messages of a user' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hey, how are you?');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Chitter is pretty cool!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('I am really enjoying Makers!');")

    peeps = Chitter.all

    expect(peeps).to include("Hey, how are you?")
    expect(peeps).to include("Chitter is pretty cool!")
    expect(peeps).to include("I am really enjoying Makers!")
  end
end
