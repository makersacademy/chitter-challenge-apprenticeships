require 'chitter'

describe '.all' do
  it 'returns all messages from peeps' do
    messages = ChitterMessage.all 
    expect(messages).to include "This is a peep!"
    expect(messages).to include "Hello everyonep!"
    expect(messages).to include "How are you!"
  end
end
