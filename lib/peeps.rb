require 'pg'
require_relative './peep_support'

class Peeps

  def self.all
      if ENV['ENVIRONMENT'] == 'test'
        conn = PG.connect( dbname: 'chitter_test' )
      else
        conn = PG.connect( dbname: 'chitter')
      end
    result = conn.exec('SELECT * FROM peeps;')
    # map! doesn't seem to be a valid method
    results = result.map { |peep| {message: peep['message'], date: peep['date'] } }
    return results # Implicit return didnt; seem to work at some point
  end

  def self.add(peep_text:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else
      conn = PG.connect( dbname: 'chitter')
    end
    p '+++++++'
    p 'Adding peep now'
    date_text = "#{Time.now.year}-#{Time.now.month}-#{check_leading_zero(Time.now.day)}"
    p date_text
    p peep_text
    conn.exec("INSERT INTO peeps (message, date) VALUES( '#{peep_text}' , '#{date_text}') ; ")
 
  end



end
