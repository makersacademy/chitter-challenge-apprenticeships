class User
  attr_reader :username, :current

  def initialize(username:, password:)
    @username = username
    @password = password
    @current = true
  end
end
