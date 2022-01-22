require 'pg'

class Chittermanager
   
  attr_reader :id, :peep, :time

  def initialize(id: nil, peep:, time: nil)
    @id  = id
    @peep = peep
    @time = time
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT id, message, time FROM peeps order by time desc;")
    result.map do |peeps|
    Chittermanager.new(id: peeps['id'], peep: peeps['message'], time: peeps['time'])
    end
  end
  
  def self.create(peep: , time:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    # result = connection.exec("INSERT INTO peeps (message, time) VALUES('#{peep}', current_timestamp) RETURNING id, message, time;")
    # Chittermanager.new(id: result[0]['id'], peep: result[0]['message'], time: result[0]['time'])
    result = connection.exec_params("INSERT INTO peeps (message, time)  VALUES($1, $2) RETURNING id, message, time;", [peep, time] ) 
   
    Chittermanager.new(id: result[0]['id'], peep: result[0]['message'], time: result[0]['time'])
  end
  
  def self.filter(filter:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
     result = connection.exec("SELECT id, message, time FROM peeps where message LIKE '%#{filter}%' order by time desc ;")
    # result = connection.exec_params("INSERT INTO peeps (message, time)  VALUES($1, $2) RETURNING id, message, time;", [peep, time] )
    # result = connection.exec_params("SELECT id, message, time FROM peeps where message LIKE '%moon%'  RETURNING id, message, time;", [filter] )
    result.map do |peeps|
    Chittermanager.new(id: peeps['id'], peep: peeps['message'], time: peeps['time'])
    end
  end

end 
