require 'pg'

class Peep
  attr_reader :id, :username, :message

  def initialize(id:, username:, message:)
    @id = id
    @username = username
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do
      Peep.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])    
    end
  end

  def self.create(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

      # I've broken it on to two lines to make it a bit more readable
      result = connection.exec_params(
        # The first argument is our SQL query template
        # The second argument is the 'params' referred to in exec_params
        # $1 refers to the first item in the params array
        # $2 refers to the second item in the params array
        "INSERT INTO peeps (username, message) VALUES($1, $2) RETURNING id, username, message;", [username, message]
      )
    Peep.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])
  end
end
