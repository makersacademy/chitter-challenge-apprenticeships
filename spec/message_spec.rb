describe '.all' do
  it 'returns a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    
    connection.exec("INSERT INTO peeps (message) VALUES ('Hi everyone');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Hope you are enjoying Chitter as much as me');")

    messages = Message.all

    expect(messages).to include('Hi everyone')
    expect(messages).to include('Hope you are enjoying Chitter as much as me')

  end
end