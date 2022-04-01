require 'pg'

class PeepViewer
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    p result[0]['message']
  end
end