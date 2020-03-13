require 'peep'

describe Peep do
  it "can view all messages" do
    messages = Peep.all
    expect(messages.length).to eq 2
    expect(messages.first).to be_a Peep
    expect(messages.first.message).to eq "This is a second peep!"
  end

  it "can post a message" do
    peep = Peep.post(message: "This is my first peep!")

    expect(peep).to be_a Peep
    expect(peep.message).to eq "This is my first peep!"
  end

  it "can check the timestamp of a message" do
    peep = Peep.post(message: "This is my first peep!")

    expect(peep.timestamp).to include '2020-03-13'
  end

  it "can filter peeps" do
    messages = Peep.filter(filter: "second")

    expect(messages.length).to eq 1
    expect(messages.last).not_to eq "This is a peep!"
  end

end
