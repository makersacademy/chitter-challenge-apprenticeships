require 'user'

describe User do
  it 'is created with a default current value of true' do
    user = User.new(username: "testUser2", password: "password")
    expect(user.username).to eq "testUser2"
  end

end
