require 'pg'

class Peep
  attr_reader :message, :date_added, :keywords, :username

  def initialize(message = '', date_added = '', keywords = '', username = '')
    @message = message
    @date_added = date_added
    @keywords = keywords
    @username = username
  end

  def self.all

    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map{ |peep| Peep.new(peep['message'], peep['date_added'], peep['keywords'], peep['username']) } 
  end
end