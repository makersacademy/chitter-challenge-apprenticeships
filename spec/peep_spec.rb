require 'peep'

describe Peep do
  it "can view all messages" do
    messages = Peep.all
    expect(messages.length).to eq 2
    expect(messages).to eq ["This is a peep!", "This is a second peep!"]
  end

  it "can post a message" do
    Peep.post(message: "This is my first peep!")

    expect(Peep.all).to include "This is my first peep!"
  end

  it "can check the timestamp of a message" do
    peep = Peep.post(message: "This is my first peep!")

    expect(peep.timestamp).to include '13/03/2020'
  end

end
