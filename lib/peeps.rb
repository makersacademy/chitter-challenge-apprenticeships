require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")

    peeps = []
    result.each do |peep|
      peeps << peep['message']
    end

    return peeps
  end

  def self.add(new_message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{new_message}')")
  end
end
