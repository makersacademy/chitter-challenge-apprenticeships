require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(peep:, timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (message, timestamp) VALUES('#{peep}', #{timestamp})")
    # connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
  end

  # def self.time
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'chitter')
  #   end

  #   connection.exec("INSERT INTO peeps (timestamp) VALUES('#{Time.now}')")
  # end
end
