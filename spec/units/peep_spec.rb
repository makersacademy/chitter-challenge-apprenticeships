require 'time'
require 'peep'
require 'user'
require 'setup_test_database'

describe Peep do
  let(:username) { double(:username) }
  let(:password) { double(:password) }
  let(:message) { double(:message) }


  describe '.add' do

    it 'can add a peep' do
      user, peep = add_test_user_and_peep(username: username, password: password, message: message)
      expect(peep.username).to eq "#{username}"
      expect(peep.message).to eq "#{message}"
    end

    it 'stores the date it was created' do
      date = Time.new
      user, peep = add_test_user_and_peep(username: username, password: password, message: message)
      expect(peep.date).to eq(date.strftime("%m/%d/%Y at %H:%M"))
    end
  end

  describe '.all' do
    it 'can show a list of peeps' do
      user, peep = add_test_user_and_peep(username: username, password: password, message: message)
      user2, peep2 = add_test_user_and_peep(username: "testuser1", password: password, message: "test message 1")
      user3, peep3 = add_test_user_and_peep(username: "testuser2", password: password, message: "test message 2")

      peeps = Peep.all

      expect(peeps.length).to be 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.username).to eq "#{username}"
      expect(peeps.first.message).to eq "#{message}"
      expect(peeps.first.id).to eq peep.id

    end
  end

  describe '.reverse' do

    it 'displays a list of peeps in reverse chronological order' do
      add_test_user_and_peep(username: username, password: password, message: "oldest")
      add_test_user_and_peep(username: "testuser1", password: password, message: "older")
      add_test_user_and_peep(username: "testuser2", password: password, message: "recent")

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
      add_test_user_and_peep(username: username, password: password, message: "oldest")
      add_test_user_and_peep(username: "testuser1", password: password, message: "older")
      add_test_user_and_peep(username: "testuser2", password: password, message: "recent message")

      peeps = Peep.reverse
      filtered_peeps = Peep.reverse("recent")

      expect(peeps.length).to be 3
      expect(filtered_peeps.length).to be 1

      expect(filtered_peeps.first.message).to include "recent"
    end
  end

  describe '.find_by_user_id' do

    it 'returns peeps by a specific user' do
      add_test_user_and_peep(username: username, password: password, message: message)
      add_test_user_and_peep(username: username, password: password, message: "message 2")
      add_test_user_and_peep(username: "a_different_user", password: password, message: "not this one")

      # TODO: need to come back and mock out this dependency on User
      user_id = User.find_id(username: username)

      user_peeps = Peep.find_by_user_id(user_id: user_id)

      expect(user_peeps.length).to eq 2
      expect(user_peeps[0].message).to include "message 2"
      expect(user_peeps[1].message).to include "#{message}"

    end
  end

end
