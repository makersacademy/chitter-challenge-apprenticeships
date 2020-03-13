require 'peep'

describe Peep do
  it "can view all messages" do
    messages = Peep.all
    expect(messages.length).to eq 2
    expect(messages).to eq ["This is a peep!", "This is a second peep!"]
  end
end