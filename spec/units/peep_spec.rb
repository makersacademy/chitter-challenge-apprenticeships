require 'time'
require 'peep'

describe Peep do
  let(:username) { double(:username) }
  let(:message) { double(:message) }

  describe '.add' do

    it 'can add a peep' do
      peep = Peep.add(username: username, message: message)
      expect(peep.username).to eq "#{username}"
      expect(peep.message).to eq "#{message}"
    end

    it 'stores the date it was created' do
      date = Time.new
      peep = Peep.add(username: username, message: message)
      expect(peep.date).to eq(date.strftime("%m/%d/%Y at %H:%M"))
    end
  end

  describe '.all' do
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

  describe '.reverse', :focus do

    it 'displays a list of peeps in reverse chronological order' do
      Peep.add(username: username, message: "oldest")
      Peep.add(username: "testuser1", message: "older")
      Peep.add(username: "testuser2", message: "recent")

      peeps = Peep.reverse

      expect(peeps.length).to be 3
      expect(peeps.first).to be_a Peep

      expect(peeps.first.message).to include "recent"
      # I couldn't figure out why this wasn't working for a while - then I realised
      # it was because of my date-time formatting - it wasn't accurate enough to
      # sort messages created so quickly together. Have created a new column
      # for sorting only to fix this bug, as it could happen in real world if This
      # were at scale.
    end

    it 'can filter results by a keyword' do
      Peep.add(username: username, message: "oldest")
      Peep.add(username: "testuser1", message: "older")
      Peep.add(username: "testuser2", message: "recent message")

      peeps = Peep.reverse
      filtered_peeps = Peep.reverse("recent")

      expect(peeps.length).to be 3
      expect(filtered_peeps.length).to be 1

      expect(filtered_peeps.first.message).to include "recent"
    end
  end

  describe '.find_by_user_id' do

    it 'returns peeps by a specific user' do

    end
  end

end
