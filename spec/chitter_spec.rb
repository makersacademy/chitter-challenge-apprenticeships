require 'chitter'

describe '.all' do
  it 'returns the messages of peeps' do
    messages = ChitterMessage.all

    expect(messages).to include "This is a peep!"
    expect(messages).to include "This is an emergency!"
  end
end