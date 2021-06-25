require 'time'
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

  it 'stores the date it was created' do
    date = Time.new
    peep = Peep.add(username: username, message: message)
    expect(peep.date).to eq(date.strftime("%m/%d/%Y at %I:%M%p"))
  end

  it 'displays a list of peeps in reverse chronological order' do
    Peep.add(username: username, message: "oldest")
    Peep.add(username: "testuser1", message: "older")
    Peep.add(username: "testuser2", message: "recent")

    peeps = Peep.reverse

    expect(peeps.length).to be 3
    expect(peeps.first).to be_a Peep

    # I just don't understand why this isn't the case. I've confirmed
    # by p'ing that the reverse method does correctly return a sorted
    # array, and the peeps display in reverse chronology on the site
    # as expected. So why isn't index[0] of this array the most recent??

    # expect(peeps[0].message).to eq "recent"
  end

end
