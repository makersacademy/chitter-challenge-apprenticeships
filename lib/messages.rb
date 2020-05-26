require 'pg'

class Messages
  attr_reader :message, :date_posted

   def initialize(message:, date_posted:)
     @message = message
     @date_posted = date_posted
   end

   def self.all

     if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peeps|
      Messages.new(message: peeps['message'],date_posted: peeps['date_posted'])
    end
   end

   def self.create(message:, date_posted:)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message, date_posted) VALUES('#{message}', '#{date_posted}') RETURNING message, date_posted")
    # Messages.new(message: result['message'], date_posted: result['date_posted'])
   end

 end
