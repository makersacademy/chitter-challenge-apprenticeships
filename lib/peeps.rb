require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    result = conn.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message']}
  end
end