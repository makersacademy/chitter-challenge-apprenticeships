require 'pg'

class Chitter
   
  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id  = id
    @peep = peep
    @timestamp = timestamp
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peeps|
    Chitter.new(id: peeps['id'], peep: peeps['peep'], timestamp: peeps['timestamp'])

    
    end
  end
  
  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
      
      result = connection.exec("INSERT INTO peeps (peep, timestamp) VALUES('#{peep}', current_timestamp) RETURNING id, peep, timestamp;")
      Chitter.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['timestamp'])
      
  end

end 
