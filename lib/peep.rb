require 'pg'

class Peep 

  t = Time.now

  attr_reader :id, :message, :time 

  def initialize(id:, message:, time:)
    @message = message
    @time = time 
    @id = id 
  end 

  def self.view_peeps
    if ENV['ENVIRONMENT'] == 'test'
  
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 

    results = con.exec('SELECT * from peeps;')
    results.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end 

  end

end 
