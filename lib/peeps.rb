require 'pg'

class Peeps

  attr_reader :id , :message , :name

  def initialize(id: ,message:, name:)
    @id = id
    @message = message
    @name = name
  end

  def self.list_peeps()
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'], name: peep['name'])
    end
  end

  def self.add_peep(message: , name:)
    @message = message
    @name = name
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message, name) VALUES ('#{@message}','#{@name}');")
    
  end

end