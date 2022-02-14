require 'chitter'

describe '.all' do
  it 'returns all messages from peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hello everyonep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('How are you!');")

    messages = ChitterMessage.all 

    expect(messages).to include "This is a peep!"
    expect(messages).to include "Hello everyonep!"
    expect(messages).to include "How are you!"
  end
end

describe '.create' do
  it 'creates a new post' do

    ChitterMessage.create(message: 'Hello everyonep!')

    expect(ChitterMessage.all).to include 'Hello everyonep!'
  end
end
