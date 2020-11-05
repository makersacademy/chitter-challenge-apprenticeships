require 'pg'

class Peeps

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    connection = connect
    result = connection.exec("SELECT * FROM peeps;")

    peeps = []
    result.each do |peep|
      peeps << peep['message']
    end

    return peeps
  end

  def self.add(new_message)
    connection = connect
    connection.exec("INSERT INTO peeps (message) VALUES('#{new_message}')")
  end
end
