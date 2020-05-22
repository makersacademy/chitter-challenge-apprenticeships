require 'chitter'

describe '.all' do
  it 'shows all the chitter messages of a user' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hey, how are you?');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Chitter is pretty cool!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('I am really enjoying Makers!');")

    messages = Chitter.all

    expect(messages).to include("Hey, how are you?")
    expect(messages).to include("Chitter is pretty cool!")
    expect(messages).to include("I am really enjoying Makers!")
  end

end
