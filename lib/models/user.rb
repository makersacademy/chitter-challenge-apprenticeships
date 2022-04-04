require_relative './post'
require_relative './databaseconnection'

class User
  attr_reader :id, :username, :password

  # User object methods
  def initialize(hash)
    @id = hash.fetch('id')
    @username = hash.fetch('username')
    @password = hash.fetch('password')
  end

  def to_h
    {
      'id' => @id,
      'username' => @username,
      'password' => @password,
    }
  end

  def get_all_posts
    r = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id='#{@id}' ORDER BY created_on DESC")
    posts = []
    for res in r.to_a
      posts.push(Post.new(res))
    end
    posts
  end

  # Static Database Methods
  def self.get_by_id(id)
    r = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}'")
    User.new(r.to_a[0])
  end

  def self.get_by_username(username)
    r = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    User.new(r.to_a[0])
  end

  def self.create(username, password)
    DatabaseConnection.query("INSERT INTO users(username, password) VALUES('#{username}', '#{password}')")
    return get_by_username(username)
  end
end
