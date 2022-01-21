require 'pg'

class Peep 

  @t = Time.now

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

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 
 
    new_post = con.exec_params("INSERT INTO peeps (message, time) VALUES($1, $2) RETURNING id, message, time;", [message, (@t.strftime("Posted at %I:%M%p"))])
    Peep.new(message: new_post[0]['message'], time: new_post[0]['time'], id: new_post[0]['id'])
  end 

  def self.search(keyword:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 

    searched_peeps = con.exec_params("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%'")
    searched_peeps.map do |peep|
     p Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
      
    end 
  end  
end 
