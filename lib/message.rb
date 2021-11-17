require 'pg'
require 'database_connection'

class Message

  attr_reader :message

  def initialize(message)
    @message = message['message']
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      puts 'connecting to test database'
      connection = PG.connect(dbname: 'chitter_test')
     else
      puts 'connecting to database'
       connection = PG.connect(dbname: 'chitter')
     end 

    result = DatabaseConnection.query('SELECT * FROM peeps;')
     result.map do |message| 
         Message.new(message)
  end 
end

  # def self.create(post:)
  #    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('{#post}');")
  # end

end 