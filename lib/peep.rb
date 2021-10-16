require 'pg'

class Peep
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| p peep['message'] }
  end

  # Initial, hard-coded version

  # def self.all
  #   # [
  #   #   "Hello, this is a new peep!", 
  #   #   "What peep shall I write today?",
  #   #   "My favourite food is pizza"
  #   # ]
  # end

end
