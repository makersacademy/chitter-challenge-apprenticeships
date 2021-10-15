require 'message'

describe '.all' do
  it 'returns all messages' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (message) VALUES('Message 1');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 2');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 3');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 4');")
    connection.exec("INSERT INTO peeps (message) VALUES('Message 5');")

    messages = Message.all

    expect(messages).to include ("Message 1")
    expect(messages).to include ("Message 2")
    expect(messages).to include ("Message 3")
    expect(messages).to include ("Message 4")
    expect(messages).to include ("Message 5")

    end

    describe '.create' do
      it 'creates a new message' do
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO peeps (message) VALUES('Hello');")
        message = Message.create
        # Message.create(message: "Hello")
        expect(message).to include ("Hello")
      end
    end
end
