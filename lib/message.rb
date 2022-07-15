require 'pg'

class Message
  # def initialize
  #   @messages = []
  # end

  # def add(message)
  #   @messages << message
  # end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps;')
    #p result
    result.map { |peep| peep['message'] }
    # return @messages
  end
end
