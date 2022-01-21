require 'pg'

class Chittermanager
   
  attr_reader :id, :peep, :timestamp

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
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peeps|
    Chittermanager.new(id: peeps['id'], peep: peeps['message'], time: peeps['time'])
    end
  end
  
  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (message, time) VALUES('#{peep}', current_timestamp) RETURNING id, message, time;")
    Chittermanager.new(id: result[0]['id'], peep: result[0]['message'], time: result[0]['time'])
      
  end

end 
