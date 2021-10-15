require "pg"

class Peep

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    # reverse_result = result.reverse
    result.map do |peep|
       Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end

    current_time = Time.now
    time = current_time.strftime("%F %T")
    result = connection.exec_params(
      "INSERT INTO peeps (message, time) VALUES($1, $2) RETURNING id, message, time;",[message, time]
    )
    Peep.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end
end

