require 'user'

describe User do
  let(:username) { double(:username) }
  let(:password) { double(:password) }

  it 'can be intialized with a username and password' do
    user = User.add(username: "testUser2", password: "password")
    expect(user.username).to eq "testUser2"
  end

  it 'can add a user' do
    user = User.add(username: username, password: password)
    expect(user.username).to eq "#{username}"
  end

  it 'can show a list of users' do
    user = User.add(username: username, password: password)
    User.add(username: "testuser1", password: "qwerty")
    User.add(username: "testuser2", password: "asdf")

    users = User.all

    expect(users.length).to be 3
    expect(users.first).to be_a User
    expect(users.first.username).to eq "#{username}"
    expect(users.first.id).to eq user.id

  end

end
