require 'pg'
require 'user'

describe User do
  let(:username) { double(:username) }
  let(:password) { double(:password) }
  let(:connection) { PG.connect(dbname: 'chitter_test') }

  it 'can be intialized with a username and password' do
    user = User.add(username: "testUser2", password: "password")
    expect(user.username).to eq "testUser2"
  end

  describe '.add' do
    it 'can add a user' do
      user = User.add(username: username, password: password)
      expect(user.username).to eq "#{username}"
    end

    it 'encrypts a users password before adding it to the databse' do
      user = User.add(username: username, password: "password")
      result = connection.exec("SELECT password FROM users WHERE id = #{user.id}")
      database_password = result[0]['password']

      expect(database_password).not_to eq("password")
    end
  end

  describe '.all' do
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

  describe '.authenticate' do
    it 'authenticates against an encrypted password' do
      user = User.add(username: username, password: "password")
      authenticated_user = User.authenticate(username: username, password: "password")
      invalid_user = User.authenticate(username: username, password: "qwerty")

      expect(user.id).to eq authenticated_user.id
      expect(invalid_user).to be nil
    end
  end

  describe '.validate?' do
    it 'checks a given username against list of registered users' do
      user = User.add(username: username, password: password)
      expect(User.validate?(username: user.username)).to eq true
    end
  end

  describe '.find', :focus do
    it 'returns the user id for a given username' do
      user = User.add(username: username, password: password)
      expect(User.find(username: username)).to eq user.id
    end
  end

end
