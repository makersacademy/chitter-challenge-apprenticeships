require 'pg'

class Message

  attr_reader :message

  def initialize(message)
    @message = message['message']
  end

  def self.all
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
     else
       connection = PG.connect(dbname: 'chitter')
     end 

    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |message| 
         Message.new(message)
  end 
end

  # def self.create(new_post:)
  #    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('{#new_post}');")
  # end

end 