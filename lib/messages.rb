require 'pg'
require 'setup_test_database'

class Messages
attr_reader :id, :message, :date , :CURRENT_DATE

  CURRENT_DATE = Time.new.day.to_s + "-" + Time.new.month.to_s + "-" + Time.new.year.to_s

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = CURRENT_DATE
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |message| 
            Messages.new(id: message['id'], message: message['message'], date: message['date']) 
    end 
  end  

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

     result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{CURRENT_DATE}') RETURNING id, message, date;")
        Messages.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end 
end