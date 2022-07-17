require 'pg'

class Peeps

  attr_reader :id, :time, :peep

  def initialize(id:, time:, peep:)
    @id = id
    @time = time
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(id: peep['id'], peep: peep['message'], time: peep['time'])
    end
  end

  def self.create(peep:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO peeps (time, message) VALUES('#{time}', '#{peep}') RETURNING id, message, time;")
    Peeps.new(id: result[0]['id'], time: result[0]['time'], peep: result[0]['message'])
  end

  def self.sort_by_time
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['message'], time: peep['time'])
    end
  end

end
