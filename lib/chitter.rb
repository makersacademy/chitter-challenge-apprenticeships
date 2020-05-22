require 'pg'

class Chits

  def self.peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps').reverse_each
    result.map { |peep| {message: peep['message'], posted_at: peep['posted_at']}}
    end


  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end

  def self.find(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT message FROM peeps WHERE message LIKE ('%#{message}%')")
    result.map { |peep| {message: peep['message'], posted_at: peep['posted_at']}}
  end
end







#
# def self.create(url:, title:)
#   if ENV['ENVIRONMENT'] == 'test'
#     connection = PG.connect(dbname: 'bookmark_manager_test')
#   else
#     connection = PG.connect(dbname: 'bookmark_manager')
#   end
#
#   result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title")
#   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
# end
