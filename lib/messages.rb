class Messages
  require 'pg'

  attr_reader :messages, :date

  def initialize(messages:, date:)
    
    @messages = messages
    @date = date
    
  end

  def self.messages
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT message, date FROM peeps;")
    result.map do |msg|
      Messages.new(messages: msg['message'], date: msg['date'])
    end
  end



  def self.add(msg)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{msg}');")
    # result.map { |messages| messages['message'] }

  end

end