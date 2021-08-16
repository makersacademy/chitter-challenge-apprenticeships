require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all messages' do
      messages = Messages.all
      expect(messages.to_s).to include("This is a peep!")
      expect(messages.to_s).to include("This is also a peep!")
    end
  end
end


describe '.create' do
  it 'creates a new bookmark' do
    Messages.create(message: "This is a test message")
    expect(Messages.all.to_s).to include 'This is a test message'
  end
end
