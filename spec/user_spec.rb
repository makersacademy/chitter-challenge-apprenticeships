require 'users'
describe '.authenticate' do
  it 'returns true given a correct username and password, if one exists' do
    user = Users.create(username: 'Bob', password: 'pass')
    expect(Users.authenticate(username: 'Bob', password: 'pass')).to eq true
  end

  it 'returns false when a correct username and incorrect password' do
    user = Users.create(username: 'Bob', password: 'pass')
    expect(Users.authenticate(username: 'Bob', password: 'wrong')).to eq false
  end

  it 'returns a user given a correct username and password, if one exists' do
    user = Users.create(username: 'Bob', password: 'pass')
    expect(Users.authenticate(username: 'notBob', password: 'pass')).to eq false
  end
end

describe '.create' do
  it 'returns true if username does not exists' do
   expect(Users.create(username: 'Bob', password: 'pass')).to eq true
  end

  it 'returns false if username exists' do
    Users.create(username: 'Bob', password: 'pass')
    expect(Users.create(username: 'Bob', password: 'pass')).to eq false
  end
end

