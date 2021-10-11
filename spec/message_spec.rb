require 'message'

describe 'Message' do
  it 'stores the messages' do
    messages = Message.all 
    expect(messages).to include "Today's first message"
  end
end