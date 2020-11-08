require 'pg'

class Peeps

attr_reader :username, :message, :id, :result, :date

  def initialize(id:, date:, username:, message:)
    @id = id
    @date = date
    @username = username
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    @result = connection.exec("SELECT * FROM peeps")
    @result.map { |peep| Peeps.new(id: peep['id'], date: peep['date'], username: peep['username'], message: peep['message']) }
  end

  def self.create(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (username, date, message) VALUES('#{username}', 'NOW()', '#{message}') RETURNING id, date, username, message")
    Peeps.new(id: result[0]['id'], date: result[0]['date'], username: result[0]['username'], message: result[0]['message'])
  end

end



#  'The weather is very gloomy',
#  'Back in lockdown!',
#  'Hope everyone is happy!'
#
