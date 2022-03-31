require 'pg'

class Post
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |post| post['message'] }
  end
end
