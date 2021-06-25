require 'peep'

describe Peep do
  let(:username) { double(:username) }
  let(:message) { double(:message) }

  it 'can add a peep' do
    peep = Peep.add(username: username, message: message)
    expect(peep.username).to eq "#{username}"
    expect(peep.message).to eq "#{message}"
  end

  it 'can show a list of peeps' do
    peep = Peep.add(username: username, message: message)
    Peep.add(username: "testuser1", message: "test message 1")
    Peep.add(username: "testuser2", message: "test message 2")

    peeps = Peep.all

    expect(peeps.length).to be 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.username).to eq "#{username}"
    expect(peeps.first.message).to eq "#{message}"
    expect(peeps.first.id).to eq peep.id

  end


end
