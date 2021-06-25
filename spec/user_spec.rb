require "user"

describe User do
  describe ".create" do
    it "creates a new user" do
      user = User.create(email: "achorbe@gmail.com", password: "1234")
      expect(user).to be_a User
      expect(user.email).to eq "achorbe@gmail.com"
    end
  end
  describe ".authenticate" do
    it "hashes the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("1234")
      User.create(email: "achorbe@gmail.com", password: "1234")
    end
  end
end
