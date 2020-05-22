require 'pg'

class Chits

  def self.peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map { |message| message['message']}
  end


  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")

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
