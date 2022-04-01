require 'pg'

class Post
  attr_reader :id, :date, :author, :message

  def initialize(id:, date:, author:, message:)
    @id = id
    @date = date
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
      Post.new(id: peep['id'], date: peep['date'], author: peep['author'], message: peep['message'])
    end
  end

  def self.create(date:, author:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec(
      "INSERT INTO peeps (date, author, message) VALUES('#{date}', '#{author}', '#{message}') 
      RETURNING id, date, author, message;")
    Post.new(id: result[0]['id'], date: result[0]['date'], author: result[0]['author'], message: result[0]['message'])
  end
end
