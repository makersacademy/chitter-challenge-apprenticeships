require 'pg'

class Message
  def self.all
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

      result = connection.exec("SELECT * FROM peeps")
      result.map { |peeps| peeps['message'] }
  end 
end 