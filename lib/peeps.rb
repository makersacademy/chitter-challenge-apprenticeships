require 'pg'

class Peeps

  attr_reader :id , :message

  def initialize(id: ,message:)
    @id = id
    @message = message
  end

  def self.list_peeps()
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'])
    end
  end

end