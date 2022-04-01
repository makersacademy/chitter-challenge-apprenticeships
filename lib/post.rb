require 'pg'

class Post
  attr_reader :id, :author, :message

  def initialize(id:, author:, message:)
    @id = id
    @author = author
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Post.new(id: peep['id'], author: peep['author'], message: peep['message'])
    end
  end

  def self.create(author:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec(
      "INSERT INTO peeps (author, message) VALUES('#{author}', '#{message}') 
      RETURNING id, author, message;")
    Post.new(id: result[0]['id'], author: result[0]['author'], message: result[0]['message'])
  end
end
