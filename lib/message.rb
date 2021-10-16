require 'pg'

class Message

  attr_reader :message, :time

  def initialize(message, time)
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params('SELECT * FROM peeps;')
    # tuples = result.map { |peep| peep }
    # @message_posted = result.map { |peep| peep['message'] } 
    # @time_posted = result.map { |peep| peep['entrytime']}
    result.map do |peep|
      Message.new(peep['message'],peep['entrytime'])
    end 
  end

  def self.create(new_message)
    p new_message
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("INSERT INTO peeps (message) VALUES($1);", [new_message])
  end
end