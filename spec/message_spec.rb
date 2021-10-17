require 'message'

describe '.create' do
  it 'creates a new message' do
    Message.create(message: 'Hello')
    expect(Message.all).to include ('Hello')
  end
end
