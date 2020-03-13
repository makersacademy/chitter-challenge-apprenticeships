require 'peep'

describe Peep do
  it "can view all messages" do
    messages = Peep.all
    expect(messages.length).to eq 1
    expect(messages).to eq ["This is a peep!"]
  end
end