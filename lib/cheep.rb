# frozen literal string: true

require 'pg'

class Cheep
  attr_reader :id, :message, :date_post

  def self.db_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.add(message:, date_post: Time.now.strftime('%Y-%m-%d %H:%M:%S'))
    result = db_connection.exec("INSERT INTO cheeps(message)
      VALUES ('#{message}')
      RETURNING id, message, date_post;")
    Cheep.new(id: result[0]['id'], message: result[0]['message'],
      date_post: result[0]['date_post'])
  end

  def self.list
    result = db_connection.exec("SELECT id, message,
      TO_CHAR(date_post, 'DD-MON-YYYY') date_post_f FROM cheeps ORDER BY date_post DESC;")
    result.map do |cheep|
      Cheep.new(id: cheep['id'], date_post: cheep['date_post_f'],
        message: cheep['message'])
    end
  end

  def initialize(id:, message:, date_post:)
    @id = id
    @message = message
    @date_post = date_post
  end
end
