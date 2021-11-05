require 'pg'

class Peeps

  def self.all
    # return ['This is a peep!']
    conn = PG.connect( dbname: 'chitter')
    result = conn.exec('SELECT * FROM peeps;')
    # map! doesn't seem to be a valid method
    results = result.map { |peep| peep['message'] }
    # return results # Implicit return didnt; seem to work at some point
  end

  def self.add(peep_text:)
    conn = PG.connect( dbname: 'chitter')
    conn.exec("INSERT INTO peeps (message) VALUES('#{peep_text}');")
  end

end
