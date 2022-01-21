require 'pg'

class Peep
  attr_reader :id, :username, :message, :datetime

  def initialize(id:, username:, message:, datetime:)
    @id = id
    @username = username
    @message = message
    @datetime = datetime
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY datetime DESC;')
    result.map do |peep| 
      Peep.new(id: peep['id'], username: peep['username'], 
        message: peep['message'], datetime: peep['datetime'])
    end
  end

  def self.add(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params(
      "INSERT INTO peeps (username, message, datetime) VALUES ($1, $2, '#{Time.new}') 
      RETURNING id, username, message;", [username, message]
    )
    Peep.new(id: result[0]['id'], username: result[0]['username'], 
      message: result[0]['message'], datetime: result[0]['datetime'])
  end
end
