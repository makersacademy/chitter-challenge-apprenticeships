require 'pg'
require 'message'
require 'spec_helper'

describe 'messages' do
  it 'check all messages are returned' do
    Message.create(message: "This is a test message")
    messages = Message.all

    expect(messages).to include "This is a test message"
  end
end