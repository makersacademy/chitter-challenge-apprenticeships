class Messages
  require 'pg'

  def initialize
    
    @messages = []
    
  end

  def self.messages
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |messages| messages['message'] }
  end

end