require 'pg'
require_relative './date.rb'

class Peeps
  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, date) VALUES ('#{message}', '#{give_date}');")
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("SELECT * FROM peeps;").to_a.reverse
  end


  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("DELETE FROM peeps WHERE id =#{id};")
  end

  def self.filter(keyword:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keyword.downcase}%';").to_a
  end
end