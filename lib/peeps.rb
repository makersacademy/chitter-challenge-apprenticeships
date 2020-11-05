require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end

    result = connection.exec("SELECT * FROM peeps;")

    peeps = []
    result.each do |peep|
      peeps << peep['message']
    end

    return peeps
  end
end
