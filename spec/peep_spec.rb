require 'peep'

describe Peep do
  it "can view all messages" do
    messages = Peep.all
    expect(messages.length).to eq 2
    expect(messages).to eq ["This is a peep!", "This is a second peep!"]
  end

  it "can post a message" do
    Peep.create(message: "This is my first peep!")

    expect(Peep.all).to include "This is my first peep!"
  end

end
