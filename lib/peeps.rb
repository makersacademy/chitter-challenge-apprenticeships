require 'pg'
require 'Date'

class Peeps

  attr_reader :id , :message , :name , :date

  def initialize(id: ,message:, name:, date:)
    @id = id
    @message = message
    @name = name
    @date = date
    
  end

  def self.list_peeps()
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'], name: peep['name'], date: peep['date'])
    end
  end

  def self.add_peep(message: , name:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    @message = message
    @name = name
    @date = date
    
    connection.exec("INSERT INTO peeps (message, name, date) VALUES ('#{@message}','#{@name}','#{@date}');")
    
  end

end