require 'pg'

class Tweets

  attr_reader :id, :message, :user_id

  def initialize(id:, message:, user_id:)
    @id = id
    @message = message
    @user_id = user_id 
  end

def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec("SELECT * FROM peeps")
  result.map do |peep|
    Tweets.new(id: peep['id'], message: peep['message'], user_id: peep['user_id'])
  end
end

def self.create(message:, user_id:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end

  result = connection.exec("INSERT INTO peeps(message, user_id) VALUES('#{message}', #{user_id}) RETURNING id, message, user_id")
  Tweets.new(id: result[0]['id'], message: result[0]['message'], user_id: result[0]['user_id'])
end
end

class User

 attr_reader :password
 attr_accessor :password_confirmation

 def self.all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec("SELECT * FROM peeps")
  result.map do |user|
    User.new(password: user['password'], email: user['email'])
  end
end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
    user
    else
    nil
    end
  end
end