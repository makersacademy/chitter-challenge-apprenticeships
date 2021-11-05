require 'pg'

class Peeps

def self.all
  # return ['This is a peep!']
  conn=PG.connect( dbname: 'chitter')
  result = conn.exec('SELECT * FROM peeps;')
  result.map {|peep| peep['message']}
end

end
