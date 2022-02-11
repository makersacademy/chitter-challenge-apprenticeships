require 'pg'

class ChitterMessage

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |message| message['message'] }
  end

end
