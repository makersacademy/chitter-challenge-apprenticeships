require 'pg'

class Peeps < Sinatra::Application
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    result = conn.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message']}
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end

    conn.exec("INSERT INTO peeps (message) VALUES ('#{message}');")
  end

end