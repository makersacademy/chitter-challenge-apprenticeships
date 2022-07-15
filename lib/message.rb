require 'pg'

class Message
  # def initialize
  #   @messages = []
  # end

  # def add(message)
  #   @messages << message
  # end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    #p result
    result.map { |peep| peep['message'] }
    # return @messages
  end
end
