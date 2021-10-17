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
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'], name: peep['name'], date: peep['date'])
    end
  end

  def self.add_peep(message: , name:, date:)
    @message = message
    @name = name
    @date = date
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message, name, date) VALUES ('#{@message}','#{@name}','#{@date}');")
    
  end

end