require 'message'

describe Message do
describe '.all' do 
  it 'shows all messages in browser' do 
    messages = Message.all

    expect(messages).to include 'This is a peep!'
  end
end
end