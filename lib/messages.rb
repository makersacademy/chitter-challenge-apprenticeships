require 'pg'

class Messages
   
  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps(message) VALUES('#{post}') RETURNING message, whenposted")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
   
      result = connection.exec("SELECT message, whenposted FROM peeps ORDER by whenposted desc")
      return result.map do |posts|
        posts = [posts['message'], posts['whenposted']]
        
      end
  end

  def self.filter(filter)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
   
      result = connection.exec("SELECT message, whenposted FROM peeps WHERE message LIKE('%#{filter}%') ORDER by whenposted desc")
      return result.map do |posts|
        posts = [posts['message'], posts['whenposted']]
        
      end
  end
end