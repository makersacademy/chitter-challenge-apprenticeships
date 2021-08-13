require 'pg'

class Peep
  

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep| peep['message'] 
    end

  end


  def self.post(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT into peeps (message) VALUES('#{peep}')")
  end


end