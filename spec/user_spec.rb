require 'user'

describe User do
  context "#all" do
    it "returns all users" do
      user1 = User.create("example name1", "name1@example.com", "password1")
      expect(User.all[-1]).to eq "example name1"
    end
  end

  context "#create" do
    it "adds a user" do
      User.create("example name2", "name2@example.com", "password2")
      expect(User.all[-1]).to eq "example name2"
    end
  end
end
