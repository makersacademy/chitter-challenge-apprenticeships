require 'pg'
require 'date'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| {message: peep['message'], date: peep['date']} }
  end

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')
    date = Date.today
    connection.exec("INSERT INTO peeps (message, date) values ('#{peep}', '#{date}');")
  end

end
