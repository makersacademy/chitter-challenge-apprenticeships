require 'message'




describe Message do 
  it 'shows all messages in browser' do 
    connection = PG.connect(dbname: 'chitter_test')

    # adding test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

    messages = Message.all
    expect(messages).to include 'This is a peep!'
  end
end


describe '.create' do 
  it " cretaes a new message" do 
    Message.create(message: 'this is a new post')

    expect(Message.all).to include 'this is a new post'
  end
end