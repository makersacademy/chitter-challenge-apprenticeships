# frozen literal string: true

require 'pg'

class Cheep
  attr_reader :id, :message

  def self.db_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.add(message:, date_post: Time.now)
    result = db_connection.exec("INSERT INTO cheeps(message, date_post)
      VALUES ('#{message}', #{date_post})
      RETURNING id, message, date_post;")
    Cheep.new(id: result[0]['id'], message: result[0]['message'],
      date_post: result[0]['date_post'])
  end

  def self.list
    result = db_connection.exec('SELECT * FROM cheeps;')
    result.map do |cheep|
      Cheep.new(id: cheep['id'], date_post: cheep['date_post'],
        message: cheep['message'])
    end
  end

  def initialize(id:, message:, date_post:)
    @id = id
    @message = message
    @date_post = date_post
  end
end
