require_relative './databaseconnection'
require_relative './user'

class Post
  attr_reader :id, :body, :created_on, :user_id

  # User object methods
  def initialize(hash)
    @id = hash.fetch('id')
    @body = hash.fetch('body')
    @created_on = hash.fetch('created_on')
    @user_id = hash.fetch('user_id')
  end

  def get_postee
    User.get_by_id(@user_id)
  end

  def to_h
    {
      'id' => @id,
      'body' => @body,
      'created_on' => @created_on,
      'user_id' => @user_id,
    }
  end

  # Static Database Methods
  def self.get_by_id(id)
    r = DatabaseConnection.query("SELECT * FROM peeps WHERE id='#{id}'")
    Post.new(r.to_a[0])
  end

  def self.get_all
    r = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_on DESC")
    posts = []
    for res in r.to_a
      posts.push(Post.new(res))
    end
    posts
  end

  def self.search_bodies(keywords)
    query = 'SELECT * FROM peeps WHERE '

    for kw in keywords
      query << "body LIKE ('%#{kw}%') OR "
    end
    query.chomp!(' OR ')

    r = DatabaseConnection.query(query)
    p query
    p r.to_a
    posts = []
    for res in r.to_a
      posts.push(Post.new(res))
    end
    posts
  end

  def self.create(body, user_id)
    DatabaseConnection.query("INSERT INTO peeps(body, user_id) VALUES('#{body}', '#{user_id}')")
    r = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id='#{user_id}'").to_a[-1]
    Post.new(r)
  end
end
